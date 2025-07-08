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
    return Scaffold(
      /* margin: const EdgeInsets.symmetric(vertical: 80), 
      height: 200, 
      padding: EdgeInsets.only(left: 20), */
       
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100,),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.sunny, 
                size: 24.0, 
                color: Colors.amberAccent.shade100
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
          Row(
            children: [
              Icon(
                Icons.waves,
                size: 24.0, 
                color: Colors.blue.shade100
              ), 
              SizedBox(width: 5.0,), 
              FutureBuilder(future: weather, builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data!.wind.toString()} KPH' ,
                    style: TextStyle(
                      color: Colors.pinkAccent.shade100,
                      fontSize: 18.0, 
                    ),); 
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}'); 
                }
                return Text(''); 
              })
            ],
          ),
          SizedBox(height: 50.0,),
          Expanded(
            child: ListView(
              children: [
                /* <a href="https://www.flaticon.com/free-icons/shirt" title="shirt icons">Shirt icons created by Freepik - Flaticon</a>*/
                Container(
                  width: 50, 
                  height: 100, 
                  child: Image(image: AssetImage('images/shirt.png')),
                ), 
                Container(
                  width: 50, 
                  height: 100,
                  child: Image(image: AssetImage('images/pants.png')), 
                )
              ],
            )
          ),
        ],
      ), 
    ); 
  }
}