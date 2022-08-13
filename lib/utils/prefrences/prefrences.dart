import 'package:shared_preferences/shared_preferences.dart';

abstract class MyPrefenrces {
  static late SharedPreferences prefs;

  static Future<void> setUserLoggedIn() async {
    await prefs.setBool("isLoggedIn", true);
  }

  static bool isUserLoggedIn() {
    return prefs.getBool("isLoggedIn") ?? false;
  }

  static Future<void> clearData() async {
    await prefs.clear();
  }
}
