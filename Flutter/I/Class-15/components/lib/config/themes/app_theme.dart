import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Colors.green;
  static const Color primaryDark = Color(0xFF272626);

  static final ThemeData lighTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const BeveledRectangleBorder(),
        backgroundColor: primaryLight,
        foregroundColor: Colors.white,
        elevation: 5,
      ),      
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primaryLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: primaryLight)
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDark,
    ),
    scaffoldBackgroundColor: Colors.grey[700],
  );
}