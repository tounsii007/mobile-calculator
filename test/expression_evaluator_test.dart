import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_calculator/expression_parser.dart';

void main() {
  test('Valid expression', () {
    final result = parseExpression('3 + 5');
    expect(result, 8);
  });

  test('Invalid expression', () {
    expect(() => parseExpression('3 +'), throwsA(isA<FormatException>()));
  });

  test('Complex expression', () {
    final result = parseExpression('2 * (3 + 5)');
    expect(result, 16);
  });
}