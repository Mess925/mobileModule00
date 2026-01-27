import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateBody extends StatefulWidget {
  const CalculateBody({super.key});

  @override
  State<CalculateBody> createState() => _CalculateBodyState();
}

class _CalculateBodyState extends State<CalculateBody> {
  String expression = '';
  String result = '0';

  void buttonOnPress(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        expression = '';
        result = '0';
      } else if (buttonText == 'C') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (buttonText == '=') {
        _calculate();
      } else {
        expression += buttonText;
      }
    });
  }

  void _calculate() {
    try {
      ShuntingYardParser parser = ShuntingYardParser();
      Expression exp = parser.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Format result: remove .0 for whole numbers
      result = eval.toString();
      if (eval == eval.toInt()) {
        result = eval.toInt().toString();
      }
    } catch (e) {
      result = 'Error';
    }
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
              onPressed: () => buttonOnPress(text),
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
          onPressed: () => buttonOnPress(text),
          child: Text(text, style: TextStyle(fontSize: 20, color: color)),
        ),
      );
    }
  }

  Widget keyPad() {
    return Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 2, color: Colors.black),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  expression.isEmpty ? '0' : expression,
                  style: const TextStyle(fontSize: 24, color: Colors.black54),
                  textAlign: TextAlign.right,
                ),
              ),
              // Result display
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Container(height: 2, color: Colors.black),
        Expanded(flex: 1, child: Container(
          color: Colors.blueGrey.shade400,
          child: keyPad())),
      ],
    );
  }
}
