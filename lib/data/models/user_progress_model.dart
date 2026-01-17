import 'package:hive/hive.dart';

part 'user_progress_model.g.dart';

/// Tracks user's learning progress
@HiveType(typeId: 5)
class UserProgress extends HiveObject {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  Map<String, bool> completedLessons;

  @HiveField(2)
  Map<String, int> quizScores;

  @HiveField(3)
  int totalPoints;

  @HiveField(4)
  int currentLevel;

  @HiveField(5)
  DateTime lastActiveDate;

  @HiveField(6)
  Map<String, double> provinceProgress; // Province ID -> Progress percentage

  @HiveField(7)
  int totalQuizzesTaken;

  @HiveField(8)
  int totalLessonsCompleted;

  UserProgress({
    required this.userId,
    Map<String, bool>? completedLessons,
    Map<String, int>? quizScores,
    this.totalPoints = 0,
    this.currentLevel = 1,
    DateTime? lastActiveDate,
    Map<String, double>? provinceProgress,
    this.totalQuizzesTaken = 0,
    this.totalLessonsCompleted = 0,
  })  : completedLessons = completedLessons ?? {},
        quizScores = quizScores ?? {},
        lastActiveDate = lastActiveDate ?? DateTime.now(),
        provinceProgress = provinceProgress ?? {};

  /// Add a completed lesson
  void addLessonCompletion(String lessonId) {
    if (!completedLessons.containsKey(lessonId)) {
      completedLessons[lessonId] = true;
      totalLessonsCompleted++;
      lastActiveDate = DateTime.now();
      save();
    }
  }

  /// Update quiz score
  void updateQuizScore(String quizId, int score) {
    final previousScore = quizScores[quizId] ?? 0;
    
    // Only update if new score is higher
    if (score > previousScore) {
      final scoreDifference = score - previousScore;
      quizScores[quizId] = score;
      totalPoints += scoreDifference;
      
      // Level up logic (every 100 points = 1 level)
      currentLevel = 1 + (totalPoints ~/ 100);
    }
    
    if (previousScore == 0) {
      totalQuizzesTaken++;
    }
    
    lastActiveDate = DateTime.now();
    save();
  }

  /// Update province completion progress
  void updateProvinceProgress(String provinceId, double progress) {
    provinceProgress[provinceId] = progress;
    save();
  }

  /// Check if a lesson is completed
  bool isLessonCompleted(String lessonId) {
    return completedLessons[lessonId] ?? false;
  }

  /// Get quiz score
  int getQuizScore(String quizId) {
    return quizScores[quizId] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'completedLessons': completedLessons,
      'quizScores': quizScores,
      'totalPoints': totalPoints,
      'currentLevel': currentLevel,
      'lastActiveDate': lastActiveDate.toIso8601String(),
      'provinceProgress': provinceProgress,
      'totalQuizzesTaken': totalQuizzesTaken,
      'totalLessonsCompleted': totalLessonsCompleted,
    };
  }

  factory UserProgress.fromJson(Map<String, dynamic> json) {
    return UserProgress(
      userId: json['userId'] as String,
      completedLessons: Map<String, bool>.from(json['completedLessons'] as Map),
      quizScores: Map<String, int>.from(json['quizScores'] as Map),
      totalPoints: json['totalPoints'] as int,
      currentLevel: json['currentLevel'] as int,
      lastActiveDate: DateTime.parse(json['lastActiveDate'] as String),
      provinceProgress: Map<String, double>.from(json['provinceProgress'] as Map),
      totalQuizzesTaken: json['totalQuizzesTaken'] as int,
      totalLessonsCompleted: json['totalLessonsCompleted'] as int,
    );
  }
}
