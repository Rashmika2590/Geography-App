import 'package:flutter/material.dart';

/// App color palette
class AppColors {
  // Primary Colors - Geography/Nature Theme
  static const Color primary = Color(0xFF2E7D32); // Forest Green
  static const Color primaryLight = Color(0xFF60AD5E);
  static const Color primaryDark = Color(0xFF005005);
  
  // Accent Colors - Water/Sky Theme
  static const Color accent = Color(0xFF1976D2); // Ocean Blue
  static const Color accentLight = Color(0xFF63A4FF);
  static const Color accentDark = Color(0xFF004BA0);
  
  // Background Colors
  static const Color background = Color(0xFFFFF8E1); // Cream
  static const Color surface = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFBF0);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  
  // Category Colors
  static const Color physicalGeo = Color(0xFF8D6E63); // Brown - Mountains/Land
  static const Color humanGeo = Color(0xFFFF9800); // Orange - People/Cities
  static const Color environmentalGeo = Color(0xFF4CAF50); // Green - Nature
  
  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA726);
  static const Color info = Color(0xFF29B6F6);
  
  // Map Colors
  static const Color mapDefault = Color(0xFFE0E0E0);
  static const Color mapSelected = Color(0xFF81C784);
  static const Color mapCompleted = Color(0xFF66BB6A);
  static const Color mapHovered = Color(0xFFAED581);
}
