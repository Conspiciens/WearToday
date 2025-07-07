import 'package:flutter/material.dart';
import 'package:weather_project/APIHandler.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});


  @override
  State<HomeWidget> createState() => _HomeWidgetState(); 
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<Weather> weather; 
  
  @override
  void initState() { 
    super.initState(); 
    weather = fetchWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20), 
      height: 200, 
      padding: EdgeInsets.only(left: 20),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Icon(
              Icons.sunny, 
              size: 24.0, 
            ),
            SizedBox(width: 5.0), 
            FutureBuilder<Weather>(future: weather, builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                print(snapshot.data!);
                return Text(snapshot.data!.temp.toString(), 
                  style: TextStyle(
                    color: Colors.pinkAccent.shade100,
                    fontSize: 20.0));  
              }  else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Text('');
            }), 
            Column(
              children: [
              Text('°C', 
                style: TextStyle(color: Colors.pinkAccent.shade100, fontSize: 10.0)),
              SizedBox(height: 20)
            ],)
          ]),
        ],
      ), 
      // child: ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: <Widget>[
      //     Container(width: 160, color: Colors.red),
      //     Container(width: 160, color: Colors.blue)
      //   ],
      // )
    ); 
  }
}