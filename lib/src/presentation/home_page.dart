import 'package:flutter/material.dart';
import 'package:weather/src/container/weather_container.dart';
import 'package:weather/src/models/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // LocationContainer(builder: builder),
            Flexible(
              child: WeatherContainer(
                builder: (BuildContext context, Weather? weather) {
                  // final double temperatureCelsius = weather!.current.temperatureKelvin! - 274.15;
                  if (weather == null) {
                    return const Text('ops');
                  }
                  return Text(weather.current.temperatureKelvin.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
