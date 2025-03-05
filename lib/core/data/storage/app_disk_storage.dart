import 'package:shared_preferences/shared_preferences.dart';

class AppDiskStorage {
  SharedPreferences? prefs;
  static AppDiskStorage? _instance;

  AppDiskStorage._();

  static AppDiskStorage get instance {
    _instance ??= AppDiskStorage._();
    return _instance!;
  }

  Future<void> _initializePrefs() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  Future<T?> getItem<T>(String key) async {
    await _initializePrefs();
    final value = prefs!.get(key);

    if (value is T) {
      return value;
    }
    return null;
  }

  setItem<T>(String key, T value) async {
    await _initializePrefs();

    if (value is String) {
      return prefs!.setString(key, value);
    } else if (value is bool) {
      return prefs!.setBool(key, value);
    } else if (value is double) {
      return prefs!.setDouble(key, value);
    } else if (value is List<String>) {
      return prefs!.setStringList(key, value);
    } else if (value is int) {
      return prefs!.setInt(key, value);
    } else {
      throw UnsupportedError('Tipo não suportado para SharedPreferences.');
    }
  }

  removeItem(String key) async {
    await _initializePrefs();
    prefs!.remove(key);
  }
}