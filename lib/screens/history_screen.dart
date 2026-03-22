import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<String> calculations;

  HistoryScreen({required this.calculations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation History'),
      ),
      body: ListView.builder(
        itemCount: calculations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(calculations[index]),
          );
        },
      ),
    );
  }
}