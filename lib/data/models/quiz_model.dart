import 'package:hive/hive.dart';

part 'quiz_model.g.dart';

/// Type of quiz question
@HiveType(typeId: 4)
enum QuizType {
  @HiveField(0)
  multipleChoice,
  
  @HiveField(1)
  mapPin,
  
  @HiveField(2)
  matchRiver,
  
  @HiveField(3)
  trueOrFalse,
}

/// Represents a quiz question
@HiveType(typeId: 3)
class Quiz extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String questionSinhala;

  @HiveField(2)
  final String questionTamil;

  @HiveField(3)
  final String questionEnglish;

  @HiveField(4)
  final QuizType type;

  @HiveField(5)
  final List<String> options;

  @HiveField(6)
  final String correctAnswer;

  @HiveField(7)
  final String explanationSinhala;

  @HiveField(8)
  final String explanationTamil;

  @HiveField(9)
  final String explanationEnglish;

  @HiveField(10)
  final int points;

  @HiveField(11)
  final String? provinceId;

  @HiveField(12)
  final int difficultyLevel; // 1-3 (Easy, Medium, Hard)

  Quiz({
    required this.id,
    required this.questionSinhala,
    required this.questionTamil,
    required this.questionEnglish,
    required this.type,
    required this.options,
    required this.correctAnswer,
    required this.explanationSinhala,
    required this.explanationTamil,
    required this.explanationEnglish,
    required this.points,
    this.provinceId,
    required this.difficultyLevel,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionSinhala': questionSinhala,
      'questionTamil': questionTamil,
      'questionEnglish': questionEnglish,
      'type': type.index,
      'options': options,
      'correctAnswer': correctAnswer,
      'explanationSinhala': explanationSinhala,
      'explanationTamil': explanationTamil,
      'explanationEnglish': explanationEnglish,
      'points': points,
      'provinceId': provinceId,
      'difficultyLevel': difficultyLevel,
    };
  }

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] as String,
      questionSinhala: json['questionSinhala'] as String,
      questionTamil: json['questionTamil'] as String,
      questionEnglish: json['questionEnglish'] as String,
      type: QuizType.values[json['type'] as int],
      options: List<String>.from(json['options'] as List),
      correctAnswer: json['correctAnswer'] as String,
      explanationSinhala: json['explanationSinhala'] as String,
      explanationTamil: json['explanationTamil'] as String,
      explanationEnglish: json['explanationEnglish'] as String,
      points: json['points'] as int,
      provinceId: json['provinceId'] as String?,
      difficultyLevel: json['difficultyLevel'] as int,
    );
  }
}
