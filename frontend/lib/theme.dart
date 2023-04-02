import 'package:flutter/material.dart';

const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFF487E4),
    onPrimary: Color.fromARGB(255, 188, 82, 173),
    secondary: Color(0xFF8B3C7F),
    onSecondary: Color(0xFF757E90),
    error: Colors.redAccent,
    onError: Colors.red,
    background: Color(0xFF192D86),
    onBackground: Colors.transparent,
    surface: Colors.transparent,
    onSurface: Colors.transparent);

final mainTheme = ThemeData(
    colorScheme: _colorScheme,
    // Define the default brightness and colors.
    brightness: Brightness.light,
    // primaryColor: Colors.lightBlue[800],

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
        fillColor: _colorScheme.primary,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.3)))),
    appBarTheme: AppBarTheme(color: _colorScheme.primary));

// final inputFieldTheme