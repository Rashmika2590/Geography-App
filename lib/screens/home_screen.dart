import 'package:flutter/material.dart';
import 'package:geography_app/screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_localizations.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/providers/geography_provider.dart';
import 'package:geography_app/providers/progress_provider.dart';
import 'package:geography_app/providers/language_provider.dart';
import 'package:geography_app/screens/province_detail_screen.dart';
import 'package:geography_app/widgets/province_card.dart';
import 'package:geography_app/widgets/interactive_province_map.dart';

/// Home Screen - Main screen showing Sri Lanka map and province list
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showGoogleMap = false;

  @override
  void initState() {
    super.initState();
    // Additional initialization if needed
  }

  @override
  Widget build(BuildContext context) {
    final geographyProvider = context.watch<GeographyProvider>();
    final progressProvider = context.watch<ProgressProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final lang = languageProvider.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.map, size: 28),
            const SizedBox(width: 8),
            Text(AppLocalizations.homeTitle(lang)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          // Progress info
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.stars,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  '${progressProvider.totalPoints}',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${AppLocalizations.level(lang)} ${progressProvider.currentLevel}',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: geographyProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : geographyProvider.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: AppColors.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        geographyProvider.error!,
                        style: AppTextStyles.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          geographyProvider.loadProvinces();
                        },
                        child: Text(AppLocalizations.retry(lang)),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Map Section (Placeholder for MVP)
                      _buildMapSection(context),
                      
                      const SizedBox(height: 16),
                      
                      // Province List Header
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              AppLocalizations.selectProvince(lang),
                              style: AppTextStyles.h2,
                            ),
                            const Spacer(),
                            Text(
                              '${geographyProvider.provinces.length} ${lang == 'si' ? 'පළාත' : (lang == 'ta' ? 'மாகாணங்கள்' : 'Provinces')}',
                              style: AppTextStyles.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Province Cards
                      ...geographyProvider.provinces.map((province) {
                        final progress = progressProvider.getProvinceProgress(province.id);
                        
                        return ProvinceCard(
                          province: province,
                          progress: progress,
                          onTap: () {
                            geographyProvider.selectProvince(province.id);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ProvinceDetailScreen(
                                  province: province,
                                ),
                              ),
                            );
                          },
                        );
                      }),
                      
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
    );
  }

  Widget _buildMapSection(BuildContext context) {
    final geographyProvider = context.watch<GeographyProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final lang = languageProvider.languageCode;
    
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // specific header for map section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _showGoogleMap ? 'Google Maps' : AppLocalizations.provinceMap(lang),
                  style: AppTextStyles.h3.copyWith(color: AppColors.primary),
                ),
                Row(
                  children: [
                    Icon(
                      _showGoogleMap ? Icons.map : Icons.map_outlined,
                      size: 20,
                      color: AppColors.textSecondary,
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: _showGoogleMap,
                      onChanged: (value) {
                        setState(() {
                          _showGoogleMap = value;
                        });
                      },
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          _showGoogleMap
              ? SizedBox(
                  height: 300,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: _buildGoogleMap(geographyProvider, languageProvider),
                  ),
                )
              : InteractiveProvinceMap(
                  provinces: geographyProvider.provinces,
                  selectedProvinceId: geographyProvider.selectedProvince?.id,
                  onProvinceSelected: (province) {
                    geographyProvider.selectProvince(province.id);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ProvinceDetailScreen(province: province),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildGoogleMap(GeographyProvider provider, LanguageProvider langProvider) {
    // Center of Sri Lanka approximately
    const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(7.8731, 80.7718),
      zoom: 7.0,
    );

    print('DEBUG: Building Google Map with ${provider.provinces.length} provinces');

    Set<Marker> markers = provider.provinces.map((province) {
      final provinceName = langProvider.getText(
        sinhala: province.nameSinhala,
        tamil: province.nameTamil,
        english: province.nameEnglish,
      );

      return Marker(
        markerId: MarkerId(province.id),
        position: LatLng(province.centerLatitude, province.centerLongitude),
        infoWindow: InfoWindow(
          title: provinceName,
          snippet: province.climate,
          onTap: () {
            provider.selectProvince(province.id);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProvinceDetailScreen(province: province),
              ),
            );
          },
        ),
      );
    }).toSet();

    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      myLocationEnabled: false,
      zoomControlsEnabled: true,
      mapType: MapType.terrain,
    );
  }
}
