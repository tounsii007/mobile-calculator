import 'package:flutter/material.dart';

class MemoryWidget extends StatefulWidget {
  @override
  _MemoryWidgetState createState() => _MemoryWidgetState();
}

class _MemoryWidgetState extends State<MemoryWidget> {
  double _memory = 0.0;
  String _displayMemory = '';

  void _addToMemory(double value) {
    setState(() {
      _memory += value;
      _displayMemory = 'M: \$_memory';
    });
  }

  void _subtractFromMemory(double value) {
    setState(() {
      _memory -= value;
      _displayMemory = 'M: \$_memory';
    });
  }

  void _memoryRecall() {
    setState(() {
      _displayMemory = 'Memory: \$_memory';
    });
  }

  void _memoryClear() {
    setState(() {
      _memory = 0.0;
      _displayMemory = 'Memory cleared';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_displayMemory),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(onPressed: () => _addToMemory(1.0), child: Text('M+')), 
            ElevatedButton(onPressed: () => _subtractFromMemory(1.0), child: Text('M-')), 
            ElevatedButton(onPressed: _memoryRecall, child: Text('MR')), 
            ElevatedButton(onPressed: _memoryClear, child: Text('MC')), 
          ],
        )
      ],
    );
  }
}