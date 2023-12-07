import 'dart:convert';
import 'package:http/http.dart' as http;

class Worker {
  late String city;
  Worker({required this.city}) {
    city = city;
  }

  late String state;
  late String country1;
  late double temp;
  late String lastseen;
  late Map condition1;
  late String text1;
  late String icon1;
  late double windSpeed;
  late int humidity1;

  Future<void> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'http://api.weatherapi.com/v1/current.json?key=1a4b30e1db514a2e970153223230301&q=$city&aqi=no'));
      var data = jsonDecode(response.body);

      //getting cityname,state,country
      var weatherdata = data["location"];
      city = weatherdata['name'];
      state = weatherdata['region'];
      country1 = weatherdata['country'];

      //getting temp,condition1,datetime
      var weatherdata1 = data['current'];
      temp = weatherdata1['temp_c'];
      lastseen = weatherdata1['last_updated'];
      condition1 = weatherdata1['condition'];
      text1 = condition1['text'];
      icon1 = condition1['icon'];
      windSpeed = weatherdata1['wind_kph'];
      humidity1 = weatherdata1['humidity'];
    } catch (e) {
      city = "Not found";
      state = "Not found";
      country1 = "Not found";
      text1 = "Not found";
      icon1 = "Not found";
      lastseen = "Not found";
      temp = 0.0;
      humidity1 = 0;
      windSpeed = 0.0;
    }
  }
}
