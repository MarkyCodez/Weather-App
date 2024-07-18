import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/home_page.dart';
import 'package:weather_app/theme/theme_services.dart';
import 'package:weather_app/theme/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeServices(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeServices>(context).theme,
      darkTheme: darkMode,
      title: "Api Fetching",
      home: const HomePage(),
    );
  }
}
