import 'package:shared_preferences/shared_preferences.dart';

class MyServices {
  static SharedPreferences? sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (sharedPreferences == null) {
      throw Exception(
          "SharedPreferences is not initialized. Call SharedPrefsHelper.init() first.");
    }
    return sharedPreferences!;
  }

  static Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  static int? getInt(String key) {
    return prefs.getInt(key);
  }

  static Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static String? getString(String key) {
    return prefs.getString(key);
  }

  static Future<void> clear() async {
    await prefs.clear();
  }
}
