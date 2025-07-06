import 'dart:async'; 
import 'dart:convert'; 

import 'package:flutter/material.dart'; 
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http; 

Future<Weather> fetchWeather() async {
  final apiKey = dotenv.maybeGet('WEATHER_API_KEY', fallback: null);

  if (apiKey == null) throw Exception('Failed to get API key'); 

  final response = await http.get(
    Uri.parse('https://weather.googleapis.com/v1/forecast/days:lookup?key=$apiKey&location.latitude=37.4220&location.longitude=-122.0841&days=2')
  ); 

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body) as Map<String, dynamic>); 
  } else {
    throw Exception('Failed to obtain response');
  }

}

class Weather {

  final int relativeHumidity;
  final int uvIndex; 
  final int wind; 

  /* final int wind; 
  final int windSpeed; 
  final int windGust;

  final int cloudCover; 
  final int rainingChance; 
  final int thunderstromChance; 

  final int maxTemp; 
  final int minTemp; 

  final int maxHeat; 
  final int weatherCondition; */ 

  const Weather({
    required this.relativeHumidity, 
    required this.uvIndex, 
    required this.wind
     }); 
    /* required this.windSpeed, 
    required this.windGust, 
    required this.cloudCover, 
    required this.rainingChance, 
    required this.thunderstromChance, 
    required this.maxTemp,
    required this.minTemp, 
    required this.maxHeat, 
    required this.weatherCondition }); */

  factory Weather.fromJson(Map<String, dynamic> json) {
    print(json['forecastDays'][0]['daytimeForecast']);
    return switch (json['forecastDays'][0]['daytimeForecast']) {
      {'relativeHumidity': int relativeHumidity, 
       'uvIndex': int uvIndex,
       'wind': {
        'speed': {'value': int wind} 
       }, 
      } => Weather(relativeHumidity: relativeHumidity, uvIndex: uvIndex, wind: wind), 
      _ => throw const FormatException('Failed to load Weather from API'),
    }; 
  }


}