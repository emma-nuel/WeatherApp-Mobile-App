import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageListTiles extends StatelessWidget {
  HomePageListTiles({super.key, required this.values});

  final List<String> title = [
    'Temperature in ℃',
    'Temperature in ℉',
    'Humidity',
    'Heat Index',
  ];
  final List<String> subtitle = [
    'Temperature in celsius',
    'Temperature in farenheit',
    'Humidity',
    'Heat index',
  ];
  final List<IconData> icon = [
    FontAwesomeIcons.temperatureEmpty,
    FontAwesomeIcons.temperatureLow,
    FontAwesomeIcons.snowflake,
    FontAwesomeIcons.sun
  ];
  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: title.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(width: 1.0),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Icon(icon[index]),
            ),
            title: Text(
              title[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle[index]),
            trailing: Text(values[index].toString()),
          ),
        );
      }),
    );
  }
}
