class ApiConstants {
  // Base URLs
  static const String openMeteoBaseUrl = 'https://api.open-meteo.com/v1';
  static const String restCountriesBaseUrl = 'https://restcountries.com/v3.1';

  // Endpoints
  static const String weatherEndpoint = '/forecast';
  static const String countryEndpoint = '/name/sri%20lanka';

  // Parameters
  static const String weatherParams = 
      'daily=temperature_2m_max,precipitation_sum&timezone=Asia/Colombo';
      
  // Google Maps
  // TODO: Replace with the key provided by user securely or via compilation config
  static const String googleMapsApiKey = 'AIzaSyC3d7coKXELrnxFCwCJ2ku2bhqnNpEo7-s'; 
}
