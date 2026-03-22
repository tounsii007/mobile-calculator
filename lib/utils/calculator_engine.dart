import 'dart:math' as math;

/// A calculator engine that performs basic and scientific calculations.
class CalculatorEngine {
  /// Adds two numbers.
  double add(double a, double b) {
    return a + b;
  }

  /// Subtracts the second number from the first number.
  double subtract(double a, double b) {
    return a - b;
  }

  /// Multiplies two numbers.
  double multiply(double a, double b) {
    return a * b;
  }

  /// Divides the first number by the second number.
  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero.');
    }
    return a / b;
  }

  /// Calculates the power of a number.
  double power(double base, double exponent) {
    return math.pow(base, exponent).toDouble();
  }

  /// Calculates the square root of a number.
  double sqrt(double value) {
    if (value < 0) {
      throw ArgumentError('Cannot take square root of a negative number.');
    }
    return math.sqrt(value);
  }

  /// Calculates the sine of an angle in radians.
  double sine(double angle) {
    return math.sin(angle);
  }

  /// Calculates the cosine of an angle in radians.
  double cosine(double angle) {
    return math.cos(angle);
  }

  /// Calculates the tangent of an angle in radians.
  double tangent(double angle) {
    return math.tan(angle);
  }

  /// Converts degrees to radians.
  double degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  /// Converts radians to degrees.
  double radiansToDegrees(double radians) {
    return radians * (180 / math.pi);
  }
}