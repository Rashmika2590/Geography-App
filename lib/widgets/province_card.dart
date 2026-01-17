import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/core/constants/app_localizations.dart';
import 'package:geography_app/providers/language_provider.dart';

/// Province Card Widget - Displays province information in a card format
class ProvinceCard extends StatelessWidget {
  final Province province;
  final double progress;
  final VoidCallback onTap;

  const ProvinceCard({
    super.key,
    required this.province,
    required this.progress,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final lang = languageProvider.languageCode;
    final provinceName = languageProvider.getText(
      sinhala: province.nameSinhala,
      tamil: province.nameTamil,
      english: province.nameEnglish,
    );

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Province Icon
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.location_on,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  // Province Name and Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provinceName,
                          style: AppTextStyles.cardTitle,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              size: 16,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${(province.population / 1000000).toStringAsFixed(1)} ${AppLocalizations.million(lang)}',
                              style: AppTextStyles.bodySmall,
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.cloud,
                              size: 16,
                              color: AppColors.textSecondary,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                province.climate.split('(').first,
                                style: AppTextStyles.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Arrow
                  const Icon(
                    Icons.chevron_right,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
              
              // Progress Bar
              if (progress > 0) ...[
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.progressLabel(lang),
                          style: AppTextStyles.bodySmall,
                        ),
                        Text(
                          '${progress.toInt()}%',
                          style: AppTextStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress / 100,
                        backgroundColor: AppColors.textHint.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.success,
                        ),
                        minHeight: 6,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
