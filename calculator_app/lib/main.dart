import 'package:flutter/material.dart';
import 'body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Calculator',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 4.0,
          backgroundColor: Colors.blueGrey.shade400,
        ),
        backgroundColor: Colors.blueGrey.shade700,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return CalculateBody();
            },
          ),
        ),
      ),
    );
  }
}
