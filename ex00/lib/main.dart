import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                child: Text('A Simple Text', style: TextStyle(fontSize: 30)),
              ),
              ElevatedButton(
                onPressed: () {print("Button Pressed");},
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
