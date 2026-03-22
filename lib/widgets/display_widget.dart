import 'package:flutter/material.dart';

class DisplayWidget extends StatelessWidget {
  final String currentInput;
  final String previousOperations;

  DisplayWidget({required this.currentInput, required this.previousOperations});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          previousOperations,
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          currentInput,
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}