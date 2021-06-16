import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesConstant {
  static SharedPreferencesConstant? _instance;
  static SharedPreferencesConstant get instance {
    _instance ??= SharedPreferencesConstant._init();
    return _instance!;
  }

  SharedPreferencesConstant._init() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
    });
  }

  SharedPreferences? _prefs;

  static Future preferencesInit() async {
    instance._prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> clearCache() async {
    await _prefs!.clear();
  }

  Future<void> setStringValue(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  String? getStringValue(String key) => _prefs?.getString(key);

  Future<void> setIntegerValue(String key, int value) async {
    await _prefs!.setInt(key, value);
  }

  int? getIntValue(String key) => _prefs?.getInt(key);

  Future<void> setDoubleValue(String key, double value) async {
    await _prefs!.setDouble(key, value);
  }

  double? getDoubleValue(String key) => _prefs?.getDouble(key);

  Future<void> setBoolValue(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }

  bool? getBoolValue(String key) => _prefs?.getBool(key);
}
