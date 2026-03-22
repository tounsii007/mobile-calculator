import 'package:flutter/foundation.dart';

class CalculatorProvider with ChangeNotifier {
  double _result = 0;

  double get result => _result;

  void add(double value) {
    _result += value;
    notifyListeners();
  }

  void subtract(double value) {
    _result -= value;
    notifyListeners();
  }

  void multiply(double value) {
    _result *= value;
    notifyListeners();
  }

  void divide(double value) {
    if (value != 0) {
      _result /= value;
      notifyListeners();
    } else {
      throw Exception('Cannot divide by zero');
    }
  }

  void clear() {
    _result = 0;
    notifyListeners();
  }
}