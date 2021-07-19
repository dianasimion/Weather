import 'package:redux/redux.dart';
import 'package:weather/src/actions/index.dart';
import 'package:weather/src/data/location_api.dart';
import 'package:weather/src/data/weather_api.dart';
import 'package:weather/src/models/index.dart';

class AppMiddleware {
  const AppMiddleware({required LocationApi locationApi, required WeatherApi weatherApi})
      : _locationApi = locationApi,
        _weatherApi = weatherApi;

  final LocationApi _locationApi;
  final WeatherApi _weatherApi;

  List<Middleware<AppState>> get middleware {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, GetLocation>(_getLocation),
      TypedMiddleware<AppState, GetWeather>(_getWeather),
    ];
  }

  Future<void> _getLocation(Store<AppState> store, GetLocation action, NextDispatcher next) async {
    next(action);
    try {
      print('location');
      final Location location = await _locationApi.getLocation();
      store.dispatch(GetLocationSuccessful(location));
      store.dispatch(GetWeather());
    } catch (error) {
      store.dispatch(GetLocationError(error));
      print(error);
    }
  }

  Future<void> _getWeather(Store<AppState> store, GetWeather action, NextDispatcher next) async {
    next(action);
    try {
      print('yo');
      print(store.state.location!.lat.toString());
      print(store.state.location!.lon.toString());

      final Weather weather = await _weatherApi.getWeather(store.state.location!);
      store.dispatch(GetWeatherSuccessful(weather));
    } catch (error) {
      print('uf');
      store.dispatch(GetWeatherError(error));
      print(error);
      print('uf');
    }
  }
}
