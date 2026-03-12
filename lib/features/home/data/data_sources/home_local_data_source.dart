import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerCacheService {
  static const dataKey = "monthly_prayers";
  static const monthKey = "month";
  static const yearKey = "year";

  /// حفظ الكاش
  static Future<void> save(List data, int month, int year) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(dataKey, jsonEncode(data));
    await prefs.setInt(monthKey, month);
    await prefs.setInt(yearKey, year);
  }

  /// قراءة الكاش
  static Future<List?> load(int month, int year) async {
    final prefs = await SharedPreferences.getInstance();

    final cacheMonth = prefs.getInt(monthKey);
    final cacheYear = prefs.getInt(yearKey);

    if (cacheMonth != month || cacheYear != year) {
      return null;
    }

    final json = prefs.getString(dataKey);

    if (json == null) return null;

    return jsonDecode(json);
  }
}
