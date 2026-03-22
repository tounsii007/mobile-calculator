// local_storage.dart

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveCalculationHistory(List<String> history) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('calculationHistory', history);
  }

  static Future<List<String>> getCalculationHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('calculationHistory') ?? [];
  }

  static Future<void> clearCalculationHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('calculationHistory');
  }
}