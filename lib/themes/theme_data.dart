import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: Brightness.light, // Set the brightness here
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  ),
  // Add other properties here
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    brightness: Brightness.dark, // Set the brightness here
  ),
  primaryColor: Colors.white,
  primaryColorDark: Colors.red,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white),
  ),
  // Add other properties here
);
