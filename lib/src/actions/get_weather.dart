part of actions;

class GetWeather {
  @override
  String toString() {
    return 'GetWeather{}';
  }
}

class GetWeatherSuccessful extends GetWeather {
  GetWeatherSuccessful(this.weather);

  final Weather weather;

  @override
  String toString() {
    return 'GetWeatherSuccessful{weather: $weather}';
  }
}

class GetWeatherError extends GetWeather {
  GetWeatherError(this.error);

  final dynamic error;

  @override
  String toString() {
    return 'GetWeatherError{error: $error}';
  }
}
