import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weather/src/actions/index.dart';
import 'package:weather/src/data/location_api.dart';
import 'package:weather/src/data/weather_api.dart';
import 'package:weather/src/models/index.dart';

class AppEpic {
  const AppEpic({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;
  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  Epic<AppState> get epic {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, GetLocation>(_getLocation),
      TypedEpic<AppState, GetWeather>(_getWeather),
    ]);
  }

  Stream<Object> _getLocation(Stream<GetLocation> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetLocation event) => _locationApi.getLocation())
        .expand((Location location) {
      return <Object>[
        GetLocationSuccessful(location),
        GetWeather(),
      ];
    }).onErrorReturnWith((Object error, StackTrace stackTrace) => GetLocationError(error));
  }

  Stream<Object> _getWeather(Stream<GetWeather> actions, EpicStore<AppState> store) {
    return actions //
        .asyncMap((GetWeather event) => _weatherApi.getWeather(store.state.location!))
        .map<Object>((Weather weather) => GetWeatherSuccessful(weather))
        .onErrorReturnWith((Object error, StackTrace stackTrace) => GetWeatherError(error));
  }
}
