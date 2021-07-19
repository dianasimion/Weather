import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:weather/src/actions/index.dart';
import 'package:weather/src/data/location_api.dart';
import 'package:weather/src/data/weather_api.dart';
import 'package:weather/src/epics/app_epic.dart';
import 'package:weather/src/middleware/middleware.dart';
import 'package:weather/src/models/index.dart';
import 'package:weather/src/presentation/home_page.dart';
import 'package:weather/src/reducer/reducer.dart';

void main() {
  const String locationApiUrl = 'http://ip-api.com/json/?fields=61439';
  const String weatherApiUrl = 'https://api.openweathermap.org/data/2.5/onecall';

  final Client client = Client();
  final LocationApi locationApi = LocationApi(apiUrl: locationApiUrl, client: client);
  final WeatherApi weatherApi = WeatherApi(apiUrl: weatherApiUrl, client: client);
  final AppMiddleware appMiddleware = AppMiddleware(locationApi: locationApi, weatherApi: weatherApi);
  final AppEpic appEpic = AppEpic(locationApi: locationApi, weatherApi: weatherApi);
  final Store<AppState> store = Store<AppState>(reducer, initialState: AppState(), //
      middleware: <Middleware<AppState>>[EpicMiddleware<AppState>(appEpic.epic)]);

  store.dispatch(GetLocation());
  runApp(App(store: store));
}

class App extends StatelessWidget {
  const App({Key? key, required this.store}) : super(key: key);

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        title: 'Weather',
        home: HomePage(),
      ),
    );
  }
}
