import 'package:shared_preferences/shared_preferences.dart';

class MyServices {
  static SharedPreferences? sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (sharedPreferences == null) {
      throw Exception(
          "SharedPreferences is not initialized. Call MyServices.init() first.");
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

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    } else {
      throw Exception("Unsupported type");
    }
  }

  static dynamic getData({required String key}) {
    return prefs.get(key);
  }

  static Future<void> removeData({required String key}) async {
    await prefs.remove(key);
  }
}
