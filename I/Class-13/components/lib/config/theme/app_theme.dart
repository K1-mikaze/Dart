import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryLight = Colors.indigo;
  static const Color primaryDark = Color(0xFF252525);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLight,
      foregroundColor: Colors.white,
      shadowColor: Colors.green,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData( 
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      backgroundColor: primaryLight,
      foregroundColor: Colors.white,
      elevation: 5,
    )
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: primaryLight,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: primaryLight),
      )
    )
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDark,
    ),
    scaffoldBackgroundColor: Colors.grey[700],
  );
}