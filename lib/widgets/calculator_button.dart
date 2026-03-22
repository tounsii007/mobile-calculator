import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CalculatorButton({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOperator = '÷×-+=%'.contains(label) || label == '⌫';
    final isEquals = label == '=';
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: isEquals
            ? Colors.orange
            : isOperator
                ? Colors.blueAccent
                : Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: (isEquals || isOperator) ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}