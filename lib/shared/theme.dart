import 'package:flutter/material.dart';

ThemeData getTheme() => ThemeData(
  primaryColor: Colors.teal[200],
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.white
    )
  )
);

class AppTheme {
  static const appBarElevation = 0.0;
  static const titleFontSize = 19.0;
}