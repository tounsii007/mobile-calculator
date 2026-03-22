class HistoryModel {
  final String calculation;
  final String result;
  final DateTime timestamp;

  HistoryModel({required this.calculation, required this.result, required this.timestamp});

  Map<String, dynamic> toJson() {
    return {
      'calculation': calculation,
      'result': result,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static HistoryModel fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      calculation: json['calculation'],
      result: json['result'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}