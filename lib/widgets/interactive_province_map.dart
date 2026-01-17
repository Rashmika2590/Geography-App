import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/core/constants/app_localizations.dart';
import 'package:geography_app/providers/language_provider.dart';

/// Interactive Province Map Widget
/// Displays clickable province boxes representing Sri Lanka's provinces
class InteractiveProvinceMap extends StatefulWidget {
  final List<Province> provinces;
  final Function(Province) onProvinceSelected;
  final String? selectedProvinceId;

  const InteractiveProvinceMap({
    super.key,
    required this.provinces,
    required this.onProvinceSelected,
    this.selectedProvinceId,
  });

  @override
  State<InteractiveProvinceMap> createState() => _InteractiveProvinceMapState();
}

class _InteractiveProvinceMapState extends State<InteractiveProvinceMap> {
  String? _hoveredProvinceId;

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final lang = languageProvider.languageCode;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Title
          Text(
            AppLocalizations.provinceMap(lang),
            style: AppTextStyles.h3.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 16),
          
          // Map Grid - Simplified representation of Sri Lankan provinces
          AspectRatio(
            aspectRatio: 0.8,
            child: Stack(
              children: [
                // Background
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                  ),
                ),
                
                // Province positions (simplified grid layout)
                ..._buildProvinceMarkers(languageProvider),
              ],
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Legend
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildLegendItem(Colors.blue.shade100, AppLocalizations.wetZone(lang)),
              _buildLegendItem(Colors.orange.shade100, AppLocalizations.dryZone(lang)),
              _buildLegendItem(Colors.green.shade100, AppLocalizations.montaneZone(lang)),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProvinceMarkers(LanguageProvider languageProvider) {
    // Simplified province positions on an imaginary Sri Lanka map
    final Map<String, Map<String, dynamic>> provincePositions = {
      'northern': {'top': 0.05, 'left': 0.35, 'color': Colors.orange.shade200},
      'north_central': {'top': 0.25, 'left': 0.35, 'color': Colors.orange.shade200},
      'north_western': {'top': 0.28, 'left': 0.15, 'color': Colors.blue.shade200},
      'central': {'top': 0.40, 'left': 0.40, 'color': Colors.green.shade200},
      'eastern': {'top': 0.45, 'left': 0.65, 'color': Colors.blue.shade200},
      'western': {'top': 0.52, 'left': 0.20, 'color': Colors.blue.shade200},
      'sabaragamuwa': {'top': 0.55, 'left': 0.35, 'color': Colors.green.shade200},
      'uva': {'top': 0.62, 'left': 0.52, 'color': Colors.green.shade200},
      'southern': {'top': 0.75, 'left': 0.32, 'color': Colors.blue.shade200},
    };

    List<Widget> markers = [];
    
    for (var province in widget.provinces) {
      final position = provincePositions[province.id];
      if (position == null) continue;
      
      final isSelected = widget.selectedProvinceId == province.id;
      final isHovered = _hoveredProvinceId == province.id;
      final provinceName = languageProvider.getText(
        sinhala: province.nameSinhala,
        tamil: province.nameTamil,
        english: province.nameEnglish,
      );
      
      markers.add(
        Positioned(
          top: MediaQuery.of(context).size.width * 0.8 * position['top'],
          left: MediaQuery.of(context).size.width * 0.8 * position['left'],
          child: MouseRegion(
            onEnter: (_) => setState(() => _hoveredProvinceId = province.id),
            onExit: (_) => setState(() => _hoveredProvinceId = null),
            child: GestureDetector(
              onTap: () => widget.onProvinceSelected(province),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : isHovered
                          ? position['color']
                          : (position['color'] as Color).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryDark : Colors.white,
                    width: isSelected ? 3 : 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(isHovered ? 0.3 : 0.1),
                      blurRadius: isHovered ? 8 : 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: isHovered || isSelected ? 24 : 20,
                      color: isSelected ? Colors.white : AppColors.primary,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      provinceName.split(' ').first,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontSize: 10,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    
    return markers;
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey.shade400),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
