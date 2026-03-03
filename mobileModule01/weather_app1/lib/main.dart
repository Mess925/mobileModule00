import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Current(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const TabBarView(
          children: [
            Center(child: Text('Currently')),
            Center(child: Text('Today')),
            Center(child: Text('Weekly')),
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.blue,
          child: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.access_time), text: 'Currently'),
              Tab(icon: Icon(Icons.today), text: 'Today'),
              Tab(icon: Icon(Icons.view_week), text: 'Weekly'),
            ],
          ),
        ),
      ),
    );
  }
}

class Current extends StatelessWidget {
  const Current({super.key});

  PreferredSizeWidget header() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Search location...',
          border: InputBorder.none,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: VerticalDivider(color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
          child: Icon(Icons.location_on),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: header(), body: const Body());
  }
}
