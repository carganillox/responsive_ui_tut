import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  String _platform = '';

  bool _isPortrait = false;
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;
  bool get isPortrait => _isPortrait;
  String get platform => _platform;

  void setDarkTheme(bool val) {
    _isDarkTheme = val;
    notifyListeners();
  }

  void setPlatForm(String str, bool bol) {
    _platform = str;
    _isPortrait = bol;
    notifyListeners();
  }
}

class DarkThemePreference {
  static const THEME_STATUS = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
