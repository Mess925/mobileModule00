import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _displayText = 'A Simple Text'; // 1. Define variable to hold text

  void _changeText() {
    setState(() {
      if (_displayText == 'A Simple Text') {
        _displayText = 'Hello World!';
      } else {
        _displayText = 'A Simple Text';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(5),
                child: Text(_displayText, style: TextStyle(fontSize: 30)),
              ),
              ElevatedButton(
                onPressed: _changeText,
                child: Text(
                  'Click Me',
                  style: TextStyle(fontSize: 10, color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
