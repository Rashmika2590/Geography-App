import 'package:hive/hive.dart';

part 'province_model.g.dart';

/// Represents a province in Sri Lanka
@HiveType(typeId: 0)
class Province extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String nameSinhala;

  @HiveField(2)
  final String nameTamil;

  @HiveField(3)
  final String nameEnglish;

  @HiveField(4)
  final String climate;

  @HiveField(5)
  final String rainfallPattern;

  @HiveField(6)
  final List<String> rivers;

  @HiveField(7)
  final List<String> agriculture;

  @HiveField(8)
  final int population;

  @HiveField(9)
  final List<String> naturalDisasters;

  @HiveField(10)
  final List<String> touristAttractions;

  @HiveField(11)
  final String svgPath;

  @HiveField(12)
  final double centerLatitude;

  @HiveField(13)
  final double centerLongitude;

  @HiveField(14)
  final String imagePath;

  @HiveField(15)
  final String description;

  Province({
    required this.id,
    required this.nameSinhala,
    required this.nameTamil,
    required this.nameEnglish,
    required this.climate,
    required this.rainfallPattern,
    required this.rivers,
    required this.agriculture,
    required this.population,
    required this.naturalDisasters,
    required this.touristAttractions,
    required this.svgPath,
    required this.centerLatitude,
    required this.centerLongitude,
    required this.imagePath,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameSinhala': nameSinhala,
      'nameTamil': nameTamil,
      'nameEnglish': nameEnglish,
      'climate': climate,
      'rainfallPattern': rainfallPattern,
      'rivers': rivers,
      'agriculture': agriculture,
      'population': population,
      'naturalDisasters': naturalDisasters,
      'touristAttractions': touristAttractions,
      'svgPath': svgPath,
      'centerLatitude': centerLatitude,
      'centerLongitude': centerLongitude,
      'imagePath': imagePath,
      'description': description,
    };
  }

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['id'] as String,
      nameSinhala: json['nameSinhala'] as String,
      nameTamil: json['nameTamil'] as String,
      nameEnglish: json['nameEnglish'] as String,
      climate: json['climate'] as String,
      rainfallPattern: json['rainfallPattern'] as String,
      rivers: List<String>.from(json['rivers'] as List),
      agriculture: List<String>.from(json['agriculture'] as List),
      population: json['population'] as int,
      naturalDisasters: List<String>.from(json['naturalDisasters'] as List),
      touristAttractions: List<String>.from(json['touristAttractions'] as List),
      svgPath: json['svgPath'] as String,
      centerLatitude: (json['centerLatitude'] as num).toDouble(),
      centerLongitude: (json['centerLongitude'] as num).toDouble(),
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
    );
  }
}
