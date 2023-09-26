import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      background: Colors.black,
    ),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Colors.white, fontSize: 70, fontWeight: FontWeight.bold)),
    useMaterial3: true,
  );
}
