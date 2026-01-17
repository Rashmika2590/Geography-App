import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/data/repositories/geography_repository.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_localizations.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/providers/geography_provider.dart';
import 'package:geography_app/providers/language_provider.dart';
import 'package:geography_app/screens/lesson_viewer_screen.dart';
import 'package:geography_app/screens/quiz_screen.dart';
import 'package:geography_app/data/models/weather_model.dart';

/// Province Detail Screen - Shows detailed information about a province
class ProvinceDetailScreen extends StatelessWidget {
  final Province province;

  const ProvinceDetailScreen({
    super.key,
    required this.province,
  });

  @override
  Widget build(BuildContext context) {
    final geographyProvider = context.watch<GeographyProvider>();
    final languageProvider = context.watch<LanguageProvider>();
    final lang = languageProvider.languageCode;
    final lessons = geographyProvider.getLessonsForProvince(province.id);
    
    final provinceName = languageProvider.getText(
      sinhala: province.nameSinhala,
      tamil: province.nameTamil,
      english: province.nameEnglish,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(provinceName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Province Header
            _buildHeader(provinceName),
            
            // Information Sections
            _buildInfoSection(
              AppLocalizations.climate(lang),
              province.climate,
              Icons.wb_sunny,
            ),

            // Live Educational Climate Data
            _buildLiveClimateData(context, lang),
            
            _buildInfoSection(
              AppLocalizations.rainfall(lang),
              province.rainfallPattern,
              Icons.water_drop,
            ),
            
            _buildListSection(
              AppLocalizations.rivers(lang),
              province.rivers,
              Icons.waves,
            ),
            
            _buildListSection(
              AppLocalizations.agriculture(lang),
              province.agriculture,
              Icons.agriculture,
            ),
            
            _buildListSection(
              AppLocalizations.naturalDisasters(lang),
              province.naturalDisasters,
              Icons.warning,
            ),
            
            _buildListSection(
              AppLocalizations.touristAttractions(lang),
              province.touristAttractions,
              Icons.attractions,
            ),
            
            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: lessons.isNotEmpty
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => LessonViewerScreen(
                                  lessons: lessons,
                                ),
                              ),
                            );
                          }
                        : null,
                    icon: const Icon(Icons.book),
                    label: Text(
                      '${AppLocalizations.lessons(lang)} (${lessons.length})',
                      style: AppTextStyles.button,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => QuizScreen(
                            provinceId: province.id,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.quiz),
                    label: Text(
                      AppLocalizations.quizzes(lang),
                      style: AppTextStyles.button,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      minimumSize: const Size(double.infinity, 56),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String provinceName) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
      ),
      child: Column(
        children: [
          Icon(
            Icons.location_city,
            size: 64,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          Text(
            provinceName,
            style: AppTextStyles.h1.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            province.description,
            style: AppTextStyles.bodyLarge.copyWith(
              color: Colors.white.withValues(alpha: 0.9),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyles.h3,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: AppTextStyles.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListSection(String title, List<String> items, IconData icon) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyles.h3,
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('• ', style: TextStyle(fontSize: 18)),
                      Expanded(
                        child: Text(
                          item,
                          style: AppTextStyles.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                )),
            if (items.isEmpty)
              Text(
                '-',
                style: AppTextStyles.bodyLarge,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveClimateData(BuildContext context, String lang) {
    // Only fetching 1st day (current forecast) for simplicity
    return FutureBuilder<List<WeatherData>>(
      future: context.read<GeographyRepository>().getWeather(
            province.centerLatitude,
            province.centerLongitude,
          ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: LinearProgressIndicator(color: AppColors.primaryLight),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }

        final data = snapshot.data!.first;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.cloud_sync, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text(
                      lang == 'si' ? 'වත්මන් දේශගුණික දත්ත' : (lang == 'ta' ? 'தற்போதைய காலநிலை' : 'Live Climate Data'),
                      style: AppTextStyles.h3,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildClimateMetric(
                        Icons.thermostat,
                        '${data.maxTemp}°C',
                        lang == 'si' ? 'උෂ්ණත්වය' : 'Temp',
                      ),
                    ),
                    Expanded(
                      child: _buildClimateMetric(
                        Icons.water_drop,
                        '${data.precipitation}mm',
                        lang == 'si' ? 'වර්ෂාපතනය' : 'Precipitation',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  lang == 'si' 
                      ? '* මෙය අධ්‍යාපනික අරමුණු සඳහා සැබෑ දත්ත වේ.' 
                      : (lang == 'ta' ? '* இது கல்வி நோக்கங்களுக்கான உண்மையான தரவு.' : '* Real data for educational purposes.'),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildClimateMetric(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, size: 20, color: AppColors.textSecondary),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppTextStyles.h2.copyWith(color: AppColors.primary),
        ),
        Text(
          label,
          style: AppTextStyles.bodySmall,
        ),
      ],
    );
  }
}
