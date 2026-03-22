import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';

class MemoryWidget extends StatelessWidget {
  const MemoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memory = context.watch<CalculatorProvider>().memory;
    final p = context.read<CalculatorProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(onPressed: p.memoryClear, child: const Text('MC')),
          TextButton(onPressed: p.memoryRecall, child: const Text('MR')),
          TextButton(onPressed: p.memoryAdd, child: const Text('M+')),
          TextButton(onPressed: p.memorySubtract, child: const Text('M-')),
          if (memory != 0)
            Text(
              'M: $memory',
              style: const TextStyle(color: Colors.blue, fontSize: 13),
            ),
        ],
      ),
    );
  }
}