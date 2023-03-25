import 'package:flutter/material.dart';
import 'package:my_weather_app/widgets/bottom_navigation_bar.dart';
import 'package:my_weather_app/widgets/carousel.dart';
import 'package:my_weather_app/widgets/listviewbuilder.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  Timer? _timer;

  late double temperature_in_celsius;
  late double temperature_in_farenheit;
  late double humidity;
  late double heatindex;

  @override
  void initState() {
    fetchData();
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setState(() {
        fetchData();
      });
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> fetchData() async {
    var url =
        Uri.parse('https://weather-app-production-8382.up.railway.app/logs/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body).last;
      // print(jsonData["temperature_in_celsius"]);
      setState(() {
        temperature_in_celsius = jsonData["temperature_in_celsius"];
        temperature_in_farenheit = jsonData["temperature_in_farenheit"];
        humidity = jsonData["humidity"];
        heatindex = jsonData["heatindex"];
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DASHBOARD"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: MyCarousel(),
              ),
              Expanded(
                flex: 3,
                child: HomePageListTiles(values: [
                  temperature_in_celsius,
                  temperature_in_farenheit,
                  humidity,
                  heatindex,
                ]),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
