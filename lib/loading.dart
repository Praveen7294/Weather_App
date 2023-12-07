import 'package:flutter/material.dart';
import 'package:weather_app/worker.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
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
    Future.delayed(const Duration(seconds: 1), () {
      if(location == "Not found") {
        Navigator.pushReplacementNamed(context, "/location");
      } else {
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
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? value = ModalRoute.of(context)?.settings.arguments as Map?;
    if(value?.isNotEmpty??false) {
      location = value!["searchText"];
    }
    recData();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 280),
            Image.asset("images/welogo.jpg", height: 150, width: 150),
            const SizedBox(height: 250),
            const Text(
              "Data from",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text("weatherapi.com",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w400,
                ))
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
