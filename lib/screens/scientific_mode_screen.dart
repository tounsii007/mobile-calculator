import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/calculator_provider.dart';
import '../utils/calculator_engine.dart';

class ScientificModeScreen extends StatelessWidget {
  const ScientificModeScreen({Key? key}) : super(key: key);

  static final _engine = CalculatorEngine();

  static const _functions = [
    'sin', 'cos', 'tan',
    'sqrt', 'x²', 'xʸ',
    'log', 'ln', 'π',
    '1/x', 'e', '(',
    ')', '!', 'rad',
  ];

  static const _accentFunctions = {'x²', 'xʸ', '1/x', '!', 'rad'};

  void _handleScientific(BuildContext context, String fn) {
    final p = context.read<CalculatorProvider>();
    final current = p.expression.isEmpty ? p.result : p.expression;
    final val = double.tryParse(current);

    switch (fn) {
      case 'sin':
        if (val != null) {
          p.clear();
          p.input(_fmt(_engine.sine(_engine.degreesToRadians(val))));
        } else {
          p.input('sin(');
        }
        break;
      case 'cos':
        if (val != null) {
          p.clear();
          p.input(_fmt(_engine.cosine(_engine.degreesToRadians(val))));
        } else {
          p.input('cos(');
        }
        break;
      case 'tan':
        if (val != null) {
          p.clear();
          p.input(_fmt(_engine.tangent(_engine.degreesToRadians(val))));
        } else {
          p.input('tan(');
        }
        break;
      case 'sqrt':
        if (val != null) {
          p.clear();
          p.input(_fmt(_engine.sqrt(val)));
        } else {
          p.input('sqrt(');
        }
        break;
      case 'x²':
        if (val != null) {
          p.clear();
          p.input(_fmt(_engine.power(val, 2)));
        }
        break;
      case 'xʸ':
        p.input('^');
        break;
      case 'log':
        p.input('log(');
        break;
      case 'ln':
        p.input('log(');
        break;
      case 'π':
        p.input('3.14159265358979');
        break;
      case 'e':
        p.input('2.71828182845905');
        break;
      case '1/x':
        if (val != null && val != 0) {
          p.clear();
          p.input(_fmt(1 / val));
        }
        break;
      case '(':
        p.input('(');
        break;
      case ')':
        p.input(')');
        break;
      case '!':
        if (val != null && val >= 0 && val == val.truncateToDouble()) {
          p.clear();
          p.input(_fmt(_factorial(val.toInt()).toDouble()));
        }
        break;
      case 'rad':
        if (val != null) {
          p.clear();
          p.input(_fmt(_engine.degreesToRadians(val)));
        }
        break;
    }
  }

  int _factorial(int n) {
    if (n <= 1) return 1;
    return n * _factorial(n - 1);
  }

  String _fmt(double v) {
    if (v == v.truncateToDouble()) return v.toInt().toString();
    return v
        .toStringAsFixed(10)
        .replaceAll(RegExp(r'0+$'), '')
        .replaceAll(RegExp(r'\.$'), '');
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CalculatorProvider>();
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.scientificCalculatorTitle)),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(16),
            child: Text(
              provider.expression.isEmpty
                  ? provider.result
                  : provider.expression,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _functions.length,
              itemBuilder: (context, index) {
                final fn = _functions[index];
                final isAccent = _accentFunctions.contains(fn);
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isAccent ? Colors.orange : Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () => _handleScientific(context, fn),
                  child: Text(fn, style: const TextStyle(fontSize: 16)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}