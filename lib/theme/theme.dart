import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.blue, // Primary color
      onPrimary: Colors.white, // On primary color
      secondary: Colors.green, // Secondary color
      onSecondary: Colors.black, // On secondary color
      background: Colors.white, // Background color
      onBackground: Colors.black, // On background color
      surface: Colors.grey[200]!, // Surface color
      onSurface: Colors.black, // On surface color
    ),
    // Additional configurations can be added here
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueAccent, // Primary color
      onPrimary: Colors.black, // On primary color
      secondary: Colors.teal, // Secondary color
      onSecondary: Colors.white, // On secondary color
      background: Colors.black, // Background color
      onBackground: Colors.white, // On background color
      surface: Colors.grey[850]!, // Surface color
      onSurface: Colors.white, // On surface color
    ),
    // Additional configurations can be added here
  );
}