import 'package:expressions/expressions.dart';

class ExpressionEvaluator {
  /// Evaluates a mathematical expression string and returns the result.
  /// 
  /// The [expressionString] parameter should be a valid mathematical expression.
  /// Throws [FormatException] if the expression is invalid.
  dynamic evaluate(String expressionString) {
    final expression = Expression.parse(expressionString);
    return expression.evaluate(null);
  }
}