import 'package:flutter/material.dart';

final ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0x00ff6f91),
    onPrimary: const Color(0x00D169A3),
    secondary: Color(0x009A67A5),
    onSecondary: Color(0x00666296),
    error: Colors.redAccent,
    onError: Colors.red,
    background: Colors.transparent,
    onBackground: Colors.transparent,
    surface: Colors.transparent,
    onSurface: Colors.transparent);

final mainTheme = ThemeData(
    colorScheme: _colorScheme,
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: Colors.lightBlue[800],

    // Define the default font family.
    fontFamily: 'Georgia',

    // Define the default `TextTheme`. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and more.
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.3)))),
    appBarTheme: AppBarTheme(color: _colorScheme.primary));

// final inputFieldTheme