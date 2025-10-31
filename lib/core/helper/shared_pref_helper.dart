import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static late SharedPreferences _prefs;
  static bool _initialized = false;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _initialized = true;
  }

  static void _checkInit() {
    if (!_initialized) {
      throw Exception(
        'SharedPrefHelper not initialized. Call SharedPrefHelper.init() in main before using it.',
      );
    }
  }

  // ---------- Primitive types ----------
  static Future<bool> setString(String key, String value) {
    _checkInit();
    return _prefs.setString(key, value);
  }

  static String? getString(String key) {
    _checkInit();
    return _prefs.getString(key);
  }

  static Future<bool> setBool(String key, bool value) {
    _checkInit();
    return _prefs.setBool(key, value);
  }

  /// ✅ هنا نرجع `bool?` مش `bool`
  static bool? getBool(String key) {
    _checkInit();
    return _prefs.getBool(key);
  }

  static Future<bool> setInt(String key, int value) {
    _checkInit();
    return _prefs.setInt(key, value);
  }

  static int? getInt(String key) {
    _checkInit();
    return _prefs.getInt(key);
  }

  static Future<bool> setDouble(String key, double value) {
    _checkInit();
    return _prefs.setDouble(key, value);
  }

  static double? getDouble(String key) {
    _checkInit();
    return _prefs.getDouble(key);
  }

  static Future<bool> setStringList(String key, List<String> value) {
    _checkInit();
    return _prefs.setStringList(key, value);
  }

  static List<String>? getStringList(String key) {
    _checkInit();
    return _prefs.getStringList(key);
  }

  // ---------- JSON (save object as String) ----------
  static Future<bool> setJson(String key, Map<String, dynamic> map) {
    _checkInit();
    final jsonString = jsonEncode(map);
    return _prefs.setString(key, jsonString);
  }

  static Map<String, dynamic>? getJson(String key) {
    _checkInit();
    final s = _prefs.getString(key);
    if (s == null) return null;
    try {
      final decoded = jsonDecode(s);
      if (decoded is Map<String, dynamic>) return decoded;
      return null;
    } catch (_) {
      return null;
    }
  }

  // ---------- Utilities ----------
  static bool containsKey(String key) {
    _checkInit();
    return _prefs.containsKey(key);
  }

  static Future<bool> remove(String key) {
    _checkInit();
    return _prefs.remove(key);
  }

  static Future<bool> clear() {
    _checkInit();
    return _prefs.clear();
  }

  static Set<String> getKeys() {
    _checkInit();
    return _prefs.getKeys();
  }
}
