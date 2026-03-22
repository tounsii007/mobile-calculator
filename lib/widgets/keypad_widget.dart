import 'package:flutter/material.dart';

import 'calculator_button.dart';

class KeypadWidget extends StatelessWidget {
  final void Function(String) onButtonPressed;

  const KeypadWidget({Key? key, required this.onButtonPressed})
      : super(key: key);

  static const _buttons = [
    'C', '⌫', '%', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '+/-', '0', '.', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const crossAxisCount = 4;
        const spacing = 6.0;
        const padding = 8.0;
        final rowCount = (_buttons.length / crossAxisCount).ceil();

        final availableWidth = constraints.maxWidth - (padding * 2);
        final availableHeight = constraints.maxHeight - (padding * 2);

        final tileWidth =
            (availableWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;
        final tileHeight =
            (availableHeight - (spacing * (rowCount - 1))) / rowCount;
        final childAspectRatio = tileWidth / tileHeight;

        return GridView.builder(
          padding: const EdgeInsets.all(padding),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: _buttons.length,
          itemBuilder: (context, index) {
            final label = _buttons[index];
            return CalculatorButton(
              label: label,
              onPressed: () => onButtonPressed(label),
            );
          },
        );
      },
    );
  }
}