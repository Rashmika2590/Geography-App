import 'package:flutter/material.dart';
import 'package:geography_app/data/models/user_progress_model.dart';
import 'package:geography_app/data/repositories/progress_repository.dart';

/// Provider for User Progress tracking
class ProgressProvider extends ChangeNotifier {
  final ProgressRepository _repository;
  
  UserProgress? _userProgress;
  bool _isLoading = false;
  String? _error;

  ProgressProvider(this._repository);

  // Getters
  UserProgress? get userProgress => _userProgress;
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get totalPoints => _userProgress?.totalPoints ?? 0;
  int get currentLevel => _userProgress?.currentLevel ?? 1;
  int get totalLessonsCompleted => _userProgress?.totalLessonsCompleted ?? 0;
  int get totalQuizzesTaken => _userProgress?.totalQuizzesTaken ?? 0;

  /// Initialize user progress
  Future<void> initializeProgress(String userId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _userProgress = await _repository.getUserProgress(userId);
      
      // If no progress exists, create new one
      if (_userProgress == null) {
        _userProgress = UserProgress(userId: userId);
        await _repository.saveUserProgress(_userProgress!);
      }
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load progress: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Mark a lesson as completed
  Future<void> completeLesson(String lessonId) async {
    if (_userProgress != null) {
      _userProgress!.addLessonCompletion(lessonId);
      await _repository.saveUserProgress(_userProgress!);
      notifyListeners();
    }
  }

  /// Update quiz score
  Future<void> updateQuizScore(String quizId, int score) async {
    if (_userProgress != null) {
      _userProgress!.updateQuizScore(quizId, score);
      await _repository.saveUserProgress(_userProgress!);
      notifyListeners();
    }
  }

  /// Update province progress
  Future<void> updateProvinceProgress(String provinceId, double progress) async {
    if (_userProgress != null) {
      _userProgress!.updateProvinceProgress(provinceId, progress);
      await _repository.saveUserProgress(_userProgress!);
      notifyListeners();
    }
  }

  /// Check if a lesson is completed
  bool isLessonCompleted(String lessonId) {
    return _userProgress?.isLessonCompleted(lessonId) ?? false;
  }

  /// Get quiz score
  int getQuizScore(String quizId) {
    return _userProgress?.getQuizScore(quizId) ?? 0;
  }

  /// Get province progress percentage
  double getProvinceProgress(String provinceId) {
    return _userProgress?.provinceProgress[provinceId] ?? 0.0;
  }

  /// Calculate overall progress percentage
  int get overallProgressPercentage {
    if (_userProgress == null || _userProgress!.provinceProgress.isEmpty) {
      return 0;
    }
    
    final totalProgress = _userProgress!.provinceProgress.values
        .fold<double>(0.0, (sum, progress) => sum + progress);
    
    final averageProgress = totalProgress / _userProgress!.provinceProgress.length;
    return averageProgress.round();
  }

  /// Get progress statistics
  ProgressStats get statistics {
    return ProgressStats(
      totalPoints: totalPoints,
      currentLevel: currentLevel,
      lessonsCompleted: totalLessonsCompleted,
      quizzesTaken: totalQuizzesTaken,
      overallProgress: overallProgressPercentage,
    );
  }

  /// Reset all progress (for testing)
  Future<void> resetProgress() async {
    if (_userProgress != null) {
      _userProgress = UserProgress(userId: _userProgress!.userId);
      await _repository.saveUserProgress(_userProgress!);
      notifyListeners();
    }
  }
}

/// Progress statistics data class
class ProgressStats {
  final int totalPoints;
  final int currentLevel;
  final int lessonsCompleted;
  final int quizzesTaken;
  final int overallProgress;

  ProgressStats({
    required this.totalPoints,
    required this.currentLevel,
    required this.lessonsCompleted,
    required this.quizzesTaken,
    required this.overallProgress,
  });
}
