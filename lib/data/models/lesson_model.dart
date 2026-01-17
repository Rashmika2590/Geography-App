import 'package:hive/hive.dart';

part 'lesson_model.g.dart';

/// Category of Geography lesson
@HiveType(typeId: 2)
enum LessonCategory {
  @HiveField(0)
  physicalGeography,
  
  @HiveField(1)
  humanGeography,
  
  @HiveField(2)
  environmentalGeography,
}

/// Represents a geography lesson
@HiveType(typeId: 1)
class Lesson extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String titleSinhala;

  @HiveField(2)
  final String titleTamil;

  @HiveField(3)
  final String titleEnglish;

  @HiveField(4)
  final String contentSinhala;

  @HiveField(5)
  final String contentTamil;

  @HiveField(6)
  final String contentEnglish;

  @HiveField(7)
  final List<String> imagePaths;

  @HiveField(8)
  final LessonCategory category;

  @HiveField(9)
  final int gradeLevel;

  @HiveField(10)
  final int order;

  @HiveField(11)
  final String? provinceId;

  @HiveField(12)
  final List<String> keyPoints;

  Lesson({
    required this.id,
    required this.titleSinhala,
    required this.titleTamil,
    required this.titleEnglish,
    required this.contentSinhala,
    required this.contentTamil,
    required this.contentEnglish,
    required this.imagePaths,
    required this.category,
    required this.gradeLevel,
    required this.order,
    this.provinceId,
    required this.keyPoints,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleSinhala': titleSinhala,
      'titleTamil': titleTamil,
      'titleEnglish': titleEnglish,
      'contentSinhala': contentSinhala,
      'contentTamil': contentTamil,
      'contentEnglish': contentEnglish,
      'imagePaths': imagePaths,
      'category': category.index,
      'gradeLevel': gradeLevel,
      'order': order,
      'provinceId': provinceId,
      'keyPoints': keyPoints,
    };
  }

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as String,
      titleSinhala: json['titleSinhala'] as String,
      titleTamil: json['titleTamil'] as String,
      titleEnglish: json['titleEnglish'] as String,
      contentSinhala: json['contentSinhala'] as String,
      contentTamil: json['contentTamil'] as String,
      contentEnglish: json['contentEnglish'] as String,
      imagePaths: List<String>.from(json['imagePaths'] as List),
      category: LessonCategory.values[json['category'] as int],
      gradeLevel: json['gradeLevel'] as int,
      order: json['order'] as int,
      provinceId: json['provinceId'] as String?,
      keyPoints: List<String>.from(json['keyPoints'] as List),
    );
  }
}
