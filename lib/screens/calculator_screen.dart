import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String display = "0";

  void buttonPressed(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

  void calculate() {
    // Simple calculation logic goes here
    try {
      // Example: evaluate expression
      // Note: Parsing logic is required here
      // display = evaluateExpression(display);
    } catch (e) {
      display = 'Error';
    }
  }

  void clear() {
    setState(() {
      display = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            display,
            style: TextStyle(fontSize: 48),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(onPressed: () => buttonPressed('1'), child: Text('1')), 
              ElevatedButton(onPressed: () => buttonPressed('2'), child: Text('2')), 
              ElevatedButton(onPressed: () => buttonPressed('3'), child: Text('3')), 
              ElevatedButton(onPressed: () => buttonPressed('+'), child: Text('+')), 
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(onPressed: () => buttonPressed('4'), child: Text('4')), 
              ElevatedButton(onPressed: () => buttonPressed('5'), child: Text('5')), 
              ElevatedButton(onPressed: () => buttonPressed('6'), child: Text('6')), 
              ElevatedButton(onPressed: () => buttonPressed('-'), child: Text('-')), 
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(onPressed: () => buttonPressed('7'), child: Text('7')), 
              ElevatedButton(onPressed: () => buttonPressed('8'), child: Text('8')), 
              ElevatedButton(onPressed: () => buttonPressed('9'), child: Text('9')), 
              ElevatedButton(onPressed: () => buttonPressed('*'), child: Text('*')), 
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(onPressed: clear, child: Text('C')), 
              ElevatedButton(onPressed: () => buttonPressed('0'), child: Text('0')), 
              ElevatedButton(onPressed: calculate, child: Text('=')), 
              ElevatedButton(onPressed: () => buttonPressed('/'), child: Text('/')), 
            ],
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: CalculatorScreen()));