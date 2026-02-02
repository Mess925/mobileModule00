import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Current(), debugShowCheckedModeBanner: false);
  }
}

class Current extends StatelessWidget {
  const Current({super.key});

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search location...',
          border: InputBorder.none,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(8),
          child: VerticalDivider(color: Colors.white),
        ),
        Icon(Icons.location_on),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: const Center(
        child: Text('Displaying current weather information here.'),
      ),
    );
  }
}
