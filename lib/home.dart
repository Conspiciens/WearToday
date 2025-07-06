import 'package:flutter/material.dart';
import 'package:weather_project/APIHandler.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState(); 
}

class _HomeWidgetState extends State<HomeWidget> {
  late Weather weather;
  
  @override
  void initState() { 
    super.initState(); 
    initWeather();
  }

  void initWeather() async {
    weather = await fetchWeather(); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20), 
      height: 200, 
      
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(width: 160, color: Colors.red),
          Container(width: 160, color: Colors.blue)
        ],
      )
    ); 
  }
}