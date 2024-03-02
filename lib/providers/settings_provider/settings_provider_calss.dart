import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  void changeLanguage(String newLanguage) async {
    var pref = await SharedPreferences.getInstance();
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    pref.setString("lang", newLanguage);
    notifyListeners();
  }

  bool isDark() {
    return appTheme == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newTheme) async {
    var pref = await SharedPreferences.getInstance();

    if (appTheme == newTheme) return;
    appTheme = newTheme;
    pref.setBool('theme', newTheme == ThemeMode.dark ? true : false);
    notifyListeners();
  }

  void getAllPrefs() async {
    var pref = await SharedPreferences.getInstance();
    appLanguage = pref.getString('lang')!;
    if (pref.getBool('theme')!) {
      appTheme = ThemeMode.dark;
    } else {
      appTheme = ThemeMode.light;
    }
    notifyListeners();
  }
}
