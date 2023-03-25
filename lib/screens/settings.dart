import 'package:flutter/material.dart';
import 'package:my_weather_app/widgets/bottom_navigation_bar.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("SETTINGS"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Center(
          child: Text("Coming Soon"),
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
