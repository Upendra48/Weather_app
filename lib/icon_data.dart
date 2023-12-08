
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class IconDataHelper {
  static IconData getWeatherIcon(String description) {
    switch (description.toLowerCase()) {
      case 'clear sky':
        return WeatherIcons.day_sunny;
      case 'few clouds':
      case 'scattered clouds':
      case 'broken clouds':
        return WeatherIcons.day_cloudy;
      case 'shower rain':
      case 'rain':
        return WeatherIcons.showers;
      case 'thunderstorm':
        return WeatherIcons.thunderstorm;
      case 'snow':
        return WeatherIcons.snow;
      case 'mist':
        return WeatherIcons.fog;
      default:
        return WeatherIcons.day_sunny;
    }
  }
}
