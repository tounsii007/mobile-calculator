import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_calculator/providers/calculator_provider.dart';

void main() {
  group('CalculatorProvider', () {
    late CalculatorProvider provider;

    setUp(() {
      provider = CalculatorProvider();
    });

    test('initial result should be 0', () {
      expect(provider.result, '0');
      expect(provider.expression, '');
    });

    test('input appends to expression', () {
      provider.input('5');
      provider.input('+');
      provider.input('3');
      expect(provider.expression, '5+3');
    });

    test('calculate evaluates expression', () {
      provider.input('5');
      provider.input('+');
      provider.input('3');
      provider.calculate();
      expect(provider.result, '8');
      expect(provider.expression, '');
    });

    test('clear resets state', () {
      provider.input('9');
      provider.clear();
      expect(provider.result, '0');
      expect(provider.expression, '');
    });

    test('backspace removes last character', () {
      provider.input('1');
      provider.input('2');
      provider.input('3');
      provider.backspace();
      expect(provider.expression, '12');
    });

    test('divide by zero returns Error', () {
      provider.input('6');
      provider.input('÷');
      provider.input('0');
      provider.calculate();
      expect(provider.result, 'Error');
    });

    test('calculation is saved to history', () {
      provider.input('2');
      provider.input('×');
      provider.input('4');
      provider.calculate();
      expect(provider.history.last, '2×4 = 8');
    });
  });
}