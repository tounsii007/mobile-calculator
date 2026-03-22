import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_calculator/providers/calculator_provider.dart';

void main() {
  group('CalculatorProvider', () {
    late CalculatorProvider calculatorProvider;

    setUp(() {
      calculatorProvider = CalculatorProvider();
    });

    test('initial value should be 0', () {
      expect(calculatorProvider.result, 0);
    });

    test('addition works correctly', () {
      calculatorProvider.add(5);
      calculatorProvider.add(3);
      expect(calculatorProvider.result, 8);
    });

    test('subtraction works correctly', () {
      calculatorProvider.subtract(5);
      expect(calculatorProvider.result, -5);
    });

    test('multiplication works correctly', () {
      calculatorProvider.multiply(5);
      expect(calculatorProvider.result, 0); // initial value is 0
      calculatorProvider.add(2);
      calculatorProvider.multiply(3);
      expect(calculatorProvider.result, 6);
    });

    test('division works correctly', () {
      calculatorProvider.add(6);
      calculatorProvider.divide(3);
      expect(calculatorProvider.result, 2);
    });
  });
}