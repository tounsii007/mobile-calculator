import 'package:math_expressions/math_expressions.dart';

class ExpressionEvaluator {
  /// Evaluates a mathematical expression string and returns the result as double.
  ///
  /// Supports +, -, *, /, %, ^, and common functions (sin, cos, tan, sqrt, etc.).
  /// Uses × and ÷ as aliases for * and /.
  /// Throws [FormatException] if the expression is invalid.
  double evaluate(String expressionString) {
    final normalized = expressionString
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll(',', '.');
    final parser = Parser();
    final expression = parser.parse(normalized);
    final contextModel = ContextModel();
    return expression.evaluate(EvaluationType.REAL, contextModel) as double;
  }
}