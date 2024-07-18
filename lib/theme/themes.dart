import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.grey.shade800,
    ),
  ),
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade300,
    onPrimary: Colors.grey.shade400,
    onSecondary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade800,
  ),
);

ThemeData darkMode = ThemeData(
   appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.grey.shade200,
    ),
  ),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    onPrimary: Colors.grey.shade600,
    onSecondary: Colors.grey.shade500,
    inversePrimary: Colors.grey.shade200,
  ),
);