import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setValue(String key, dynamic value) async {
    if (value is String) await _prefs.setString(key, value);
    if (value is bool) await _prefs.setBool(key, value);
    if (value is int) await _prefs.setInt(key, value);
  }

  static String? getString(String key) => _prefs.getString(key);
  static bool? getBool(String key) => _prefs.getBool(key);
  static int? getInt(String key) => _prefs.getInt(key);
  static Future<void> remove(String key) => _prefs.remove(key);
}
