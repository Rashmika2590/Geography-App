import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// App text styles using Google Fonts optimized for Sinhala
class AppTextStyles {
  // Headings - Noto Serif Sinhala for elegance
  static TextStyle get h1 => GoogleFonts.notoSerifSinhala(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h2 => GoogleFonts.notoSerifSinhala(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle get h3 => GoogleFonts.notoSerifSinhala(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  // Body Text - Noto Sans Sinhala for readability
  static TextStyle get bodyLarge => GoogleFonts.notoSansSinhala(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodyMedium => GoogleFonts.notoSansSinhala(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.textPrimary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.notoSansSinhala(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  // Button Text
  static TextStyle get button => GoogleFonts.notoSansSinhala(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 0.5,
      );

  // Caption/Hint
  static TextStyle get caption => GoogleFonts.notoSansSinhala(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.textHint,
        height: 1.3,
      );

  // Quiz Questions
  static TextStyle get quizQuestion => GoogleFonts.notoSansSinhala(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  // Card Titles
  static TextStyle get cardTitle => GoogleFonts.notoSerifSinhala(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
        height: 1.3,
      );
}
