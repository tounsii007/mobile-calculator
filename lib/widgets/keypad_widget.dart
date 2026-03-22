import 'package:flutter/material.dart';

class KeypadWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: <Widget>[
        _buildButton('7'),
        _buildButton('8'),
        _buildButton('9'),
        _buildButton('/'),
        _buildButton('4'),
        _buildButton('5'),
        _buildButton('6'),
        _buildButton('*'),
        _buildButton('1'),
        _buildButton('2'),
        _buildButton('3'),
        _buildButton('-'),
        _buildButton('0'),
        _buildButton('.'),
        _buildButton('='),
        _buildButton('+'),
      ],
    );
  }

  Widget _buildButton(String label) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(label,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}