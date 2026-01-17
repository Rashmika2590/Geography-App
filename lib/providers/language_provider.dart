import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Supported app languages
enum AppLanguage {
  sinhala('si', 'සිංහල'),
  tamil('ta', 'தமிழ்'),
  english('en', 'English');

  final String code;
  final String name;
  
  const AppLanguage(this.code, this.name);
}

/// Provider for app language selection
class LanguageProvider extends ChangeNotifier {
  static const String _languageKey = 'app_language';
  
  AppLanguage _currentLanguage = AppLanguage.sinhala; // Default to Sinhala
  SharedPreferences? _prefs;

  LanguageProvider() {
    _loadLanguage();
  }

  AppLanguage get currentLanguage => _currentLanguage;
  String get languageCode => _currentLanguage.code;
  String get languageName => _currentLanguage.name;

  /// Load saved language preference
  Future<void> _loadLanguage() async {
    _prefs = await SharedPreferences.getInstance();
    final savedLanguageCode = _prefs?.getString(_languageKey);
    
    if (savedLanguageCode != null) {
      try {
        _currentLanguage = AppLanguage.values.firstWhere(
          (lang) => lang.code == savedLanguageCode,
        );
      } catch (e) {
        _currentLanguage = AppLanguage.sinhala;
      }
    }
    
    notifyListeners();
  }

  /// Change app language
  Future<void> setLanguage(AppLanguage language) async {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      await _prefs?.setString(_languageKey, language.code);
      notifyListeners();
    }
  }

  /// Get text in current language from multi-language object
  String getText({
    required String sinhala,
    required String tamil,
    required String english,
  }) {
    switch (_currentLanguage) {
      case AppLanguage.sinhala:
        return sinhala;
      case AppLanguage.tamil:
        return tamil.isNotEmpty ? tamil : sinhala;
      case AppLanguage.english:
        return english.isNotEmpty ? english : sinhala;
    }
  }
}
