
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static const String isLogin = 'isLogin';

  static Future<bool?> getLoginText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin);
  }

  static Future<void> setLoginText(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLogin, value);
  }
}