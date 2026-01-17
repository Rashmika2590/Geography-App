import 'package:hive_flutter/hive_flutter.dart';
import 'package:geography_app/data/models/province_model.dart';
import 'package:geography_app/data/models/lesson_model.dart';
import 'package:geography_app/data/models/quiz_model.dart';
import 'package:geography_app/data/models/user_progress_model.dart';

/// Hive storage service for offline data persistence
class StorageService {
  static const String provincesBox = 'provinces';
  static const String lessonsBox = 'lessons';
  static const String quizzesBox = 'quizzes';
  static const String userProgressBox = 'userProgress';
  static const String settingsBox = 'settings';

  /// Initialize Hive and register adapters
  static Future<void> initialize() async {
    await Hive.initFlutter();

    // Register type adapters
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(ProvinceAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(LessonAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(LessonCategoryAdapter());
    }
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(QuizAdapter());
    }
    if (!Hive.isAdapterRegistered(4)) {
      Hive.registerAdapter(QuizTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(5)) {
      Hive.registerAdapter(UserProgressAdapter());
    }

    // Open boxes
    await Hive.openBox<Province>(provincesBox);
    await Hive.openBox<Lesson>(lessonsBox);
    await Hive.openBox<Quiz>(quizzesBox);
    await Hive.openBox<UserProgress>(userProgressBox);
    await Hive.openBox(settingsBox); // For simple key-value pairs
  }

  /// Get provinces box
  static Box<Province> getProvincesBox() => Hive.box<Province>(provincesBox);

  /// Get lessons box
  static Box<Lesson> getLessonsBox() => Hive.box<Lesson>(lessonsBox);

  /// Get quizzes box
  static Box<Quiz> getQuizzesBox() => Hive.box<Quiz>(quizzesBox);

  /// Get user progress box
  static Box<UserProgress> getUserProgressBox() =>
      Hive.box<UserProgress>(userProgressBox);

  /// Get settings box
  static Box getSettingsBox() => Hive.box(settingsBox);

  /// Close all boxes
  static Future<void> closeAll() async {
    await Hive.close();
  }
}
