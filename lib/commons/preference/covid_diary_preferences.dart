import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

typedef _ListString = List<String>;
typedef _MapString = Map<String, dynamic>;

class CovidDiaryPreferences {
  static late SharedPreferences _preferences;

  static bool isDarkTheme = false;
  static bool isLoggedIn = false;
  static bool isFirstTime = true;

  static void setValue<T>(String key, T value) {
    if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is String) {
      _preferences.setString(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    } else if (value is Map<String, dynamic>) {
      String valueStr = jsonEncode(value);
      _preferences.setString(key, valueStr);
    } else {
      throw Exception('${value.runtimeType} is not supported');
    }
  }

  static T getValue<T>(String key) {
    Type _type = T;
    dynamic value;
    if (_type == bool) {
      value = _preferences.getBool(key) ?? false;
    } else if (_type == String) {
      value = _preferences.getString(key) ?? '';
    } else if (_type == _ListString) {
      value = _preferences.getStringList(key) ?? [];
    } else if (_type == _MapString) {
      value = jsonDecode(_preferences.getString(key) ?? '{}');
    } else {
      throw Exception('$_type is not supported');
    }
    return value as T;
  }

   static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

}
