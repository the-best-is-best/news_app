import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean(
      {required String key, required bool val}) async {
    return await sharedPreferences.setBool(key, val);
  }

  static bool getBoolean({required String key}) {
    return sharedPreferences.getBool(key) ?? false;
  }
}
