import 'package:flutter/material.dart';
import 'package:weather_app/icon_data.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  final WeatherService weatherService;

  WeatherPage({required this.weatherService});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late Weather _weather;
  late TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _weather = Weather(cityName: '', temperature: 0, description: '');
    _cityController = TextEditingController();
  }

  Future<void> _fetchWeather(String cityName) async {
    try {
      final weather = await widget.weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Weather App',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown, Colors.blueGrey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _fetchWeather(_cityController.text),
                child: Text('Get Weather',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              SizedBox(height: 20),
              Icon(
                IconDataHelper.getWeatherIcon(_weather.description),
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 30),
              Text(
                'City: ${_weather.cityName}',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Temperature: ${_weather.temperature}°C',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Description: ${_weather.description}',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
