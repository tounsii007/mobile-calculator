import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_calculator/utils/calculator_engine.dart';

void main() {
  late CalculatorEngine engine;

  setUp(() {
    engine = CalculatorEngine();
  });

  group('CalculatorEngine Tests', () {
    test('Addition', () {
      expect(engine.add(2, 3), 5);
    });

    test('Subtraction', () {
      expect(engine.subtract(5, 3), 2);
    });

    test('Multiplication', () {
      expect(engine.multiply(2, 3), 6);
    });

    test('Division', () {
      expect(engine.divide(6, 2), 3);
    });

    test('Division by zero throws ArgumentError', () {
      expect(() => engine.divide(6, 0), throwsA(isA<ArgumentError>()));
    });

    test('Power', () {
      expect(engine.power(2, 10), 1024);
    });

    test('Square root', () {
      expect(engine.sqrt(9), 3);
    });

    test('Square root of negative throws ArgumentError', () {
      expect(() => engine.sqrt(-1), throwsA(isA<ArgumentError>()));
    });

    test('Sine of 0', () {
      expect(engine.sine(0), 0);
    });

    test('Cosine of 0', () {
      expect(engine.cosine(0), 1);
    });

    test('Degrees to radians', () {
      expect(engine.degreesToRadians(180), closeTo(3.14159, 0.0001));
    });
  });
}