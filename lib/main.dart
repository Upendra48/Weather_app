
import 'package:flutter/material.dart';
import 'pages/weather_page.dart';
import 'services/weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String apiKey = '47bd431a2d63bdeb03ce13b79e6f7c28';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: WeatherPage(weatherService: WeatherService(apiKey: apiKey)),
    );
  }
}
