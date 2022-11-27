import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  
  /* the goal is to create a custom theming page where we et values here to change the whole app */
  ThemeMode _themeMode = ThemeMode.dark; /* starting theme */

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void changeThemeMode() {
    isDarkMode ? _themeMode = ThemeMode.light :  _themeMode = ThemeMode.dark;
     notifyListeners();
  }

}
