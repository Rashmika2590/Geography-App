import 'package:geography_app/core/constants/api_constants.dart';
import 'package:geography_app/data/models/weather_model.dart';
import 'package:geography_app/data/services/api_service.dart';

class WeatherService {
  final ApiService _apiService;
  final Map<String, List<WeatherData>> _cache = {};

  WeatherService(this._apiService);

  Future<List<WeatherData>> getProvinceWeather(
    double lat,
    double lng,
  ) async {
    final key = '$lat,$lng';
    if (_cache.containsKey(key)) {
      return _cache[key]!;
    }

    final url = '${ApiConstants.openMeteoBaseUrl}${ApiConstants.weatherEndpoint}'
        '?latitude=$lat&longitude=$lng&${ApiConstants.weatherParams}';

    try {
      final json = await _apiService.get(url);
      final List<dynamic> dates = json['daily']['time'];
      
      final data = List.generate(
        dates.length,
        (index) => WeatherData.fromJson(json, index),
      );
      
      _cache[key] = data;
      return data;
    } catch (e) {
      // Return empty list on error for resilience
      print('Weather fetch error: $e');
      return [];
    }
  }
}
