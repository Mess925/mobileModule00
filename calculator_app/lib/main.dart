import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

Widget calcButton(String text, {Color color = Colors.black}) {
  if (text == '=') {
    return Expanded(
      flex: 2,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double buttonWidth = constraints.maxWidth / 2;
          double offsetFromLeft = buttonWidth / 2;
          return TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () => print(text),
            child: Container(
              width: constraints.maxWidth,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: offsetFromLeft - 7),
              child: Text(text, style: TextStyle(fontSize: 20, color: color)),
            ),
          );
        },
      ),
    );
  } else {
    return Expanded(
      child: TextButton(
        onPressed: () => print(text),
        child: Text(text, style: TextStyle(fontSize: 20, color: color)),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calculator')),
          elevation: 4.0,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            // Text fields section - takes half the screen
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: '0',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                  TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: '0',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
            Divider(),
            // Buttons section - takes half the screen
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('7'),
                      calcButton('8'),
                      calcButton('9'),
                      calcButton('C', color: Colors.red),
                      calcButton('AC', color: Colors.red),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('4'),
                      calcButton('5'),
                      calcButton('6'),
                      calcButton('+', color: Colors.white),
                      calcButton('-', color: Colors.white),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('1'),
                      calcButton('2'),
                      calcButton('3'),
                      calcButton('*', color: Colors.white),
                      calcButton('/', color: Colors.white),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      calcButton('0'),
                      calcButton('.'),
                      calcButton('00'),
                      calcButton('=', color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
