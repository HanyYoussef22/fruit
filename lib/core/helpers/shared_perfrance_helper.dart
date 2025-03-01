import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _instance.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _instance.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await _instance.setString(key, value);
        break;
      case int:
        await _instance.setInt(key, value);
        break;
      case bool:
        await _instance.setBool(key, value);
        break;
      case double:
        await _instance.setDouble(key, value);
        break;
      default:
        throw UnsupportedError("Unsupported data type");
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool getBool(String key) {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _instance.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double getDouble(String key) {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _instance.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static int getInt(String key) {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _instance.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with given [key].
  static String getString(String key) {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return _instance.getString(key) ?? '';
  }
}



