import 'package:geography_app/core/constants/api_constants.dart';
import 'package:geography_app/data/models/country_model.dart';
import 'package:geography_app/data/services/api_service.dart';

class CountryService {
  final ApiService _apiService;

  CountryService(this._apiService);

  Future<CountryStats?> getSriLankaStats() async {
    final url = '${ApiConstants.restCountriesBaseUrl}${ApiConstants.countryEndpoint}';

    try {
      final jsonList = await _apiService.get(url);
      if (jsonList is List && jsonList.isNotEmpty) {
        return CountryStats.fromJson(jsonList.first);
      }
      return null;
    } catch (e) {
      print('Country stats fetch error: $e');
      return null;
    }
  }
}
