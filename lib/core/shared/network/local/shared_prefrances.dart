import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static late SharedPreferences preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData(key, value) {
    return preferences.setBool(key, value);
  }

  bool? getData(key) {
    return preferences.getBool(key);
  }
}
