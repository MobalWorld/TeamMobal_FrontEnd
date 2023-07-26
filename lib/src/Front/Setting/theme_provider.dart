import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeProvider with ChangeNotifier {
  ThemeType _currentTheme = ThemeType.light;

  ThemeType get currentTheme => _currentTheme;

  bool get isDarkMode => _currentTheme == ThemeType.dark;

  void toggleTheme() {
    _currentTheme = _currentTheme == ThemeType.light ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }
}
