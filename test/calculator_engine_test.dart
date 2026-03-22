import 'package:test/test.dart';

void main() {
  group('Calculator Engine Tests', () {
    test('Addition Test', () {
      expect(add(2, 3), 5);
    });
    test('Subtraction Test', () {
      expect(subtract(5, 3), 2);
    });
    test('Multiplication Test', () {
      expect(multiply(2, 3), 6);
    });
    test('Division Test', () {
      expect(divide(6, 2), 3);
    });
    test('Division by Zero', () {
      expect(() => divide(6, 0), throwsA(isA<DivisionByZeroException>()));
    });
  });
}

int add(int a, int b) => a + b;
int subtract(int a, int b) => a - b;
int multiply(int a, int b) => a * b;
int divide(int a, int b) {
  if (b == 0) throw DivisionByZeroException();
  return a ~/ b;
}

class DivisionByZeroException implements Exception {}