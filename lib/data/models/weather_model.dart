class WeatherData {
  final double maxTemp;
  final double precipitation;
  final String date;

  WeatherData({
    required this.maxTemp,
    required this.precipitation,
    required this.date,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json, int index) {
    return WeatherData(
      maxTemp: (json['daily']['temperature_2m_max'][index] as num).toDouble(),
      precipitation: (json['daily']['precipitation_sum'][index] as num).toDouble(),
      date: json['daily']['time'][index] as String,
    );
  }
}
