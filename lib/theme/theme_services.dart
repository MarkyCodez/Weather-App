import 'package:flutter/material.dart';
import 'package:weather_app/theme/themes.dart';

class ThemeServices extends ChangeNotifier {
  ThemeData _theme = lightMode;
  ThemeData get theme => _theme;
  bool get isDarkMode => _theme == darkMode;
  set theme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  toggleTheme() {
    _theme == lightMode ? theme = darkMode : theme = lightMode;
  }
}
