import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geography_app/core/constants/app_colors.dart';
import 'package:geography_app/core/constants/app_text_styles.dart';
import 'package:geography_app/providers/language_provider.dart';
import 'package:geography_app/screens/home_screen.dart';

/// Language Selection Screen - User chooses their preferred language
class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                
                // App Icon
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.map,
                      size: 56,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Title
                Text(
                  'GeoLanka',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h1.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Subtitle
                Text(
                  'ඔබේ භාෂාව තෝරන්න\nஉங்கள் மொழியை தேர்ந்தெடுக்கவும்\nChoose Your Language',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // Language Options
                ...AppLanguage.values.map((language) {
                  final isSelected = languageProvider.currentLanguage == language;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _LanguageCard(
                      language: language,
                      isSelected: isSelected,
                      onTap: () {
                        languageProvider.setLanguage(language);
                      },
                    ),
                  );
                }),
                
                const SizedBox(height: 32),
                
                // Continue Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _getContinueText(languageProvider.currentLanguage),
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.primary,
                      fontSize: 18,
                    ),
                  ),
                ),
                
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getContinueText(AppLanguage language) {
    switch (language) {
      case AppLanguage.sinhala:
        return 'ආරම්භ කරන්න';
      case AppLanguage.tamil:
        return 'தொடங்கவும்';
      case AppLanguage.english:
        return 'Continue';
    }
  }
}

class _LanguageCard extends StatelessWidget {
  final AppLanguage language;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Selection indicator
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : Colors.white,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
            
            const SizedBox(width: 16),
            
            // Language name
            Text(
              language.name,
              style: AppTextStyles.h3.copyWith(
                color: isSelected ? AppColors.primary : Colors.white,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
