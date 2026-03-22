import 'package:flutter/foundation.dart';
import '../utils/expression_evaluator.dart';

class CalculatorProvider with ChangeNotifier {
  String _expression = '';
  String _result = '0';
  double _memory = 0.0;
  final List<String> _history = [];
  final ExpressionEvaluator _evaluator = ExpressionEvaluator();

  String get expression => _expression;
  String get result => _result;
  double get memory => _memory;
  List<String> get history => List.unmodifiable(_history);

  void input(String value) {
    // After a completed calculation, pressing a number starts fresh;
    // pressing an operator continues from the result.
    if (_expression.isEmpty && _result != '0') {
      if ('+-×÷*/'.contains(value)) {
        _expression = _result + value;
      } else {
        _expression = value;
      }
      _result = '0';
    } else {
      _expression += value;
    }
    notifyListeners();
  }

  void calculate() {
    if (_expression.isEmpty) return;
    try {
      final res = _evaluator.evaluate(_expression);
      final resStr = _formatResult(res);
      _history.add('$_expression = $resStr');
      _result = resStr;
      _expression = '';
    } catch (_) {
      _result = 'Error';
      _expression = '';
    }
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _result = '0';
    notifyListeners();
  }

  void backspace() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      notifyListeners();
    }
  }

  void toggleSign() {
    if (_expression.isNotEmpty) {
      if (_expression.startsWith('-')) {
        _expression = _expression.substring(1);
      } else {
        _expression = '-$_expression';
      }
      notifyListeners();
    } else if (_result != '0' && _result != 'Error') {
      final val = double.tryParse(_result);
      if (val != null) {
        _result = _formatResult(-val);
        notifyListeners();
      }
    }
  }

  void percentage() {
    final target = _expression.isNotEmpty ? _expression : _result;
    final val = double.tryParse(target);
    if (val != null) {
      final pct = _formatResult(val / 100);
      if (_expression.isNotEmpty) {
        _expression = pct;
      } else {
        _result = pct;
      }
      notifyListeners();
    }
  }

  void memoryAdd() {
    _memory += double.tryParse(_result) ?? 0;
    notifyListeners();
  }

  void memorySubtract() {
    _memory -= double.tryParse(_result) ?? 0;
    notifyListeners();
  }

  void memoryRecall() {
    _expression += _formatResult(_memory);
    notifyListeners();
  }

  void memoryClear() {
    _memory = 0.0;
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }

  String _formatResult(double value) {
    if (value.isNaN || value.isInfinite) return 'Error';
    if (value == value.truncateToDouble()) return value.toInt().toString();
    // Remove trailing zeros up to 10 decimal places
    return value
        .toStringAsFixed(10)
        .replaceAll(RegExp(r'0+$'), '')
        .replaceAll(RegExp(r'\.$'), '');
  }
}