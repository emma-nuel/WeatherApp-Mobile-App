import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Timer? _timer;
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _startTimer();
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
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Convert the response body from a string to a JSON object
      var jsonData = json.decode(response.body);
      setState(() {
        _data = jsonData;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(_data[index]['title']),
          subtitle: Text(_data[index]['body']),
        );
      },
    );
  }
}
