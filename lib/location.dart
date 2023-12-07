import 'package:flutter/material.dart';
import 'package:weather_app/worker.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String location = "roorkee";
  late String state;
  late String country1;
  late double temp;
  late String lastseen1;
  late String text1;
  late String icon1;
  late double windSpeed1;
  late int humidity2;
  void recData() async {
    Worker instance = Worker(city: location);
    await instance.getData();
    location = instance.city;
    state = instance.state;
    country1 = instance.country1;
    lastseen1 = instance.lastseen;
    temp = instance.temp;
    text1 = instance.text1;
    icon1 = instance.icon1;
    windSpeed1 = instance.windSpeed;
    humidity2 = instance.humidity1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,size: 100,),
                const Text("City not found",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(onPressed: () {
                  recData();
                  Future.delayed(const Duration(seconds: 0), () {
                    Navigator.pushReplacementNamed(context, '/home', arguments: {
                      "city_value": location,
                      "state_value": state,
                      "country1_value": country1,
                      "last_seen": lastseen1.toString(),
                      "temp_value": temp.toString(),
                      "text1": text1,
                      "icon": icon1.toString(),
                      "windSpeed2": windSpeed1.toString(),
                      "humidity3": humidity2.toString(),
                    });
                  });
                }, child: const Text("Back"))
              ],
            ),
          ),
        )
    );
  }
}
