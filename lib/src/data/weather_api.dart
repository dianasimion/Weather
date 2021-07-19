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
    final String completeUrl = '$_apiUrl?lat=${location.lat}&lon=${location.lon}&exclude=hourly,minutely&appid=18c70221d0a3f05fe3a4029fc806701b';
    // final String test = 'https://api.openweathermap.org/data/2.5/onecall?lat=47.0317&lon=23.9092&exclude=hourly,minutely&appid=503ad05f4fe3732aa3078ffcd21a3f09';
    // 01c9b6a7efc52483cd7bf1c892b3309f
    final Uri url = Uri.parse(completeUrl);
    final Response response = await _client.get(url);

    if (response.statusCode >= 300) {
      throw StateError(response.body);
    }

    return Weather.fromJson(jsonDecode(response.body));
  }
}

