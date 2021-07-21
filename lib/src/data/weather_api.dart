import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather/src/models/index.dart';

class WeatherApi {
  const WeatherApi({required String apiUrl, required Client client})
      : _apiUrl = apiUrl,
        _client = client;

  final String _apiUrl;
  final Client _client;

  Future<Weather> getWeather(Location location) async {
    final String completeUrl =
        '$_apiUrl?lat=${location.lat}&lon=${location.lon}&exclude=hourly,minutely&appid=18c70221d0a3f05fe3a4029fc806701b';
    final Uri url = Uri.parse(completeUrl);
    final Response response = await _client.get(url);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    return Weather.fromJson(jsonDecode(response.body));
  }
}
