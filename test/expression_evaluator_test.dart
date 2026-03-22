import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_calculator/utils/expression_evaluator.dart';

void main() {
  late ExpressionEvaluator evaluator;

  setUp(() {
    evaluator = ExpressionEvaluator();
  });

  group('ExpressionEvaluator Tests', () {
    test('Valid simple expression', () {
      expect(evaluator.evaluate('3+5'), 8);
    });

    test('Expression with multiplication and addition', () {
      expect(evaluator.evaluate('2*(3+5)'), 16);
    });

    test('Division', () {
      expect(evaluator.evaluate('10/2'), 5);
    });

    test('Division symbol ÷', () {
      expect(evaluator.evaluate('10÷2'), 5);
    });

    test('Multiplication symbol ×', () {
      expect(evaluator.evaluate('3×4'), 12);
    });

    test('Invalid expression throws', () {
      expect(() => evaluator.evaluate('3 +'), throwsA(anything));
    });
  });
}