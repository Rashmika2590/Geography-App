import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/data/models/lesson_model.dart';
import 'package:geography_app/data/models/quiz_model.dart';
import 'package:geography_app/core/services/storage_service.dart';
import 'package:geography_app/data/local/sample_data.dart';
import 'package:geography_app/data/services/api_service.dart';
import 'package:geography_app/data/services/weather_service.dart';
import 'package:geography_app/data/services/country_service.dart';
import 'package:geography_app/data/models/weather_model.dart';
import 'package:geography_app/data/models/country_model.dart';

/// Repository for Geography data (Provinces, Lessons, Quizzes, APIs)
class GeographyRepository {
  final WeatherService _weatherService;
  final CountryService _countryService;

  GeographyRepository()
      : _weatherService = WeatherService(ApiService()),
        _countryService = CountryService(ApiService());

  /// Initialize sample data if not already loaded
  Future<void> initializeSampleData() async {
    final provincesBox = StorageService.getProvincesBox();
    final lessonsBox = StorageService.getLessonsBox();
    final quizzesBox = StorageService.getQuizzesBox();

    // Load sample data if boxes are empty
    if (provincesBox.isEmpty) {
      final provinces = SampleData.getProvinces();
      for (var province in provinces) {
        await provincesBox.put(province.id, province);
      }
    }

    if (lessonsBox.isEmpty) {
      final lessons = SampleData.getLessons();
      for (var lesson in lessons) {
        await lessonsBox.put(lesson.id, lesson);
      }
    }

    if (quizzesBox.isEmpty) {
      final quizzes = SampleData.getQuizzes();
      for (var quiz in quizzes) {
        await quizzesBox.put(quiz.id, quiz);
      }
    }
  }

  // ... Local Data Methods ...

  /// Get weather for a location (province center)
  Future<List<WeatherData>> getWeather(double lat, double lng) async {
    return await _weatherService.getProvinceWeather(lat, lng);
  }

  /// Get Sri Lanka country stats
  Future<CountryStats?> getCountryStats() async {
    return await _countryService.getSriLankaStats();
  }

  /// Get all provinces
  Future<List<Province>> getAllProvinces() async {
    final provincesBox = StorageService.getProvincesBox();
    return provincesBox.values.toList();
  }

  /// Get province by ID
  Future<Province?> getProvinceById(String id) async {
    final provincesBox = StorageService.getProvincesBox();
    return provincesBox.get(id);
  }

  /// Get all lessons
  Future<List<Lesson>> getAllLessons() async {
    final lessonsBox = StorageService.getLessonsBox();
    return lessonsBox.values.toList();
  }

  /// Get lessons for a specific province
  Future<List<Lesson>> getLessonsByProvince(String provinceId) async {
    final lessonsBox = StorageService.getLessonsBox();
    return lessonsBox.values
        .where((lesson) => lesson.provinceId == provinceId)
        .toList();
  }

  /// Get lesson by ID
  Future<Lesson?> getLessonById(String id) async {
    final lessonsBox = StorageService.getLessonsBox();
    return lessonsBox.get(id);
  }

  /// Get all quizzes
  Future<List<Quiz>> getAllQuizzes() async {
    final quizzesBox = StorageService.getQuizzesBox();
    return quizzesBox.values.toList();
  }

  /// Get quizzes for a specific province
  Future<List<Quiz>> getQuizzesByProvince(String provinceId) async {
    final quizzesBox = StorageService.getQuizzesBox();
    return quizzesBox.values
        .where((quiz) => quiz.provinceId == provinceId)
        .toList();
  }

  /// Get quiz by ID
  Future<Quiz?> getQuizById(String id) async {
    final quizzesBox = StorageService.getQuizzesBox();
    return quizzesBox.get(id);
  }
}

