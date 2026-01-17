import 'package:flutter/material.dart';
import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/data/models/lesson_model.dart';
import 'package:geography_app/data/repositories/geography_repository.dart';

/// Provider for Geography data (Provinces and Lessons)
class GeographyProvider extends ChangeNotifier {
  final GeographyRepository _repository;

  List<Province> _provinces = [];
  Province? _selectedProvince;
  List<Lesson> _lessons = [];
  List<Lesson> _filteredLessons = [];
  bool _isLoading = false;
  String? _error;

  GeographyProvider(this._repository) {
    loadProvinces();
    loadLessons();
  }

  // Getters
  List<Province> get provinces => _provinces;
  Province? get selectedProvince => _selectedProvince;
  List<Lesson> get lessons => _lessons;
  List<Lesson> get filteredLessons => _filteredLessons;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Load all provinces from repository
  Future<void> loadProvinces() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _provinces = await _repository.getAllProvinces();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load provinces: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Select a province
  void selectProvince(String provinceId) {
    _selectedProvince = _provinces.firstWhere(
      (p) => p.id == provinceId,
      orElse: () => _provinces.first,
    );
    notifyListeners();
  }

  /// Clear selected province
  void clearSelectedProvince() {
    _selectedProvince = null;
    notifyListeners();
  }

  /// Load all lessons
  Future<void> loadLessons() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _lessons = await _repository.getAllLessons();
      _filteredLessons = _lessons;
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load lessons: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Get lessons for a specific province
  List<Lesson> getLessonsForProvince(String provinceId) {
    return _lessons.where((lesson) => lesson.provinceId == provinceId).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  /// Filter lessons by category
  void filterLessonsByCategory(LessonCategory category) {
    _filteredLessons = _lessons.where((l) => l.category == category).toList();
    notifyListeners();
  }

  /// Filter lessons by grade level
  void filterLessonsByGrade(int gradeLevel) {
    _filteredLessons = _lessons.where((l) => l.gradeLevel ==gradeLevel).toList();
    notifyListeners();
  }

  /// Reset lesson filters
  void resetLessonFilters() {
    _filteredLessons = _lessons;
    notifyListeners();
  }

  /// Get province by ID
  Province? getProvinceById(String id) {
    try {
      return _provinces.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
