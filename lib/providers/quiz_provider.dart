import 'package:flutter/material.dart';
import 'package:geography_app/data/models/quiz_model.dart';
import 'package:geography_app/data/repositories/geography_repository.dart';
import 'package:geography_app/providers/progress_provider.dart';

/// Provider for Quiz functionality
class QuizProvider extends ChangeNotifier {
  final GeographyRepository _repository;
  final ProgressProvider _progressProvider;

  List<Quiz> _quizzes = [];
  List<Quiz> _currentQuizSet = [];
  int _currentQuizIndex = 0;
  Map<String, String> _userAnswers = {};
  int _score = 0;
  bool _isQuizActive = false;
  bool _isLoading = false;
  String? _error;

  QuizProvider(this._repository, this._progressProvider) {
    loadQuizzes();
  }

  // Getters
  List<Quiz> get quizzes => _quizzes;
  List<Quiz> get currentQuizSet => _currentQuizSet;
  Quiz? get currentQuiz => _isQuizActive && _currentQuizIndex < _currentQuizSet.length
      ? _currentQuizSet[_currentQuizIndex]
      : null;
  int get currentQuizIndex => _currentQuizIndex;
  int get totalQuestions => _currentQuizSet.length;
  Map<String, String> get userAnswers => _userAnswers;
  int get score => _score;
  bool get isQuizActive => _isQuizActive;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasNextQuestion => _currentQuizIndex < _currentQuizSet.length - 1;
  bool get isLastQuestion => _currentQuizIndex == _currentQuizSet.length - 1;

  /// Load all quizzes
  Future<void> loadQuizzes() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      _quizzes = await _repository.getAllQuizzes();
      
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load quizzes: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Start a quiz for a specific province
  void startQuiz(String provinceId) {
    _currentQuizSet = _quizzes
        .where((quiz) => quiz.provinceId == provinceId)
        .toList();
    _currentQuizIndex = 0;
    _userAnswers = {};
    _score = 0;
    _isQuizActive = true;
    notifyListeners();
  }

  /// Start a quiz with custom quiz set
  void startCustomQuiz(List<Quiz> quizSet) {
    _currentQuizSet = quizSet;
    _currentQuizIndex = 0;
    _userAnswers = {};
    _score = 0;
    _isQuizActive = true;
    notifyListeners();
  }

  /// Submit answer for current question
  void submitAnswer(String answer) {
    if (currentQuiz != null) {
      _userAnswers[currentQuiz!.id] = answer;
      
      // Check if answer is correct and update score
      if (answer == currentQuiz!.correctAnswer) {
        _score += currentQuiz!.points;
      }
      
      notifyListeners();
    }
  }

  /// Move to next question
  void nextQuestion() {
    if (hasNextQuestion) {
      _currentQuizIndex++;
      notifyListeners();
    }
  }

  /// Move to previous question
  void previousQuestion() {
    if (_currentQuizIndex > 0) {
      _currentQuizIndex--;
      notifyListeners();
    }
  }

  /// Finish the quiz and save progress
  void finishQuiz() {
    if (_isQuizActive && _currentQuizSet.isNotEmpty) {
      // Save quiz scores to progress
      for (var quiz in _currentQuizSet) {
        final userAnswer = _userAnswers[quiz.id] ?? '';
        final earnedPoints = userAnswer == quiz.correctAnswer ? quiz.points : 0;
        _progressProvider.updateQuizScore(quiz.id, earnedPoints);
      }
      
      _isQuizActive = false;
      notifyListeners();
    }
  }

  /// Reset quiz
  void resetQuiz() {
    _currentQuizIndex = 0;
    _userAnswers = {};
    _score = 0;
    _isQuizActive = false;
    _currentQuizSet = [];
    notifyListeners();
  }

  /// Get quiz result
  QuizResult getQuizResult() {
    final totalQuestions = _currentQuizSet.length;
    final correctAnswers = _userAnswers.entries
        .where((entry) {
          final quiz = _currentQuizSet.firstWhere((q) => q.id == entry.key);
          return entry.value == quiz.correctAnswer;
        })
        .length;
    
    final percentage = totalQuestions > 0 
        ? (correctAnswers / totalQuestions * 100).round()
        : 0;

    return QuizResult(
      totalQuestions: totalQuestions,
      correctAnswers: correctAnswers,
      score: _score,
      percentage: percentage,
    );
  }

  /// Check if an answer is correct
  bool isAnswerCorrect(String quizId) {
    final quiz = _currentQuizSet.firstWhere((q) => q.id == quizId);
    final userAnswer = _userAnswers[quizId];
    return userAnswer == quiz.correctAnswer;
  }

  /// Get quizzes for a province
  List<Quiz> getQuizzesForProvince(String provinceId) {
    return _quizzes.where((quiz) => quiz.provinceId == provinceId).toList();
  }
}

/// Quiz result data class
class QuizResult {
  final int totalQuestions;
  final int correctAnswers;
  final int score;
  final int percentage;

  QuizResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.score,
    required this.percentage,
  });

  String get grade {
    if (percentage >= 90) return 'විශිෂ්ට';
    if (percentage >= 75) return 'ඉතා හොඳයි';
    if (percentage >= 60) return 'හොඳයි';
    if (percentage >= 50) return 'සාමාන්‍ය';
    return 'වැඩිදියුණු කළ යුතුයි';
  }
}
