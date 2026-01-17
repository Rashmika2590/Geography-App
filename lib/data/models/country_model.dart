class CountryStats {
  final double area;
  final int population;
  final List<String> borders;
  final String region;
  final String subregion;

  CountryStats({
    required this.area,
    required this.population,
    required this.borders,
    required this.region,
    required this.subregion,
  });

  factory CountryStats.fromJson(Map<String, dynamic> json) {
    return CountryStats(
      area: (json['area'] as num).toDouble(),
      population: json['population'] as int,
      borders: List<String>.from(json['borders'] ?? []),
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
    );
  }
}
