import '../cache/shared/shared_pref_cache.dart';

class CacheProvider {
  String? getStringCache(String key) {
    return SharedPreferencesConstant.instance.getStringValue(key);
  }

  int? getIntCache(String key) {
    return SharedPreferencesConstant.instance.getIntValue(key);
  }

  bool? getBoolCache(String key) {
    return SharedPreferencesConstant.instance.getBoolValue(key);
  }

  Future<void> clearCache() {
    return SharedPreferencesConstant.instance.clearCache();
  }
}
