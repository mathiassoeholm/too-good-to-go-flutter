import 'package:flutter/material.dart';

ThemeData getTheme() => ThemeData(
  primaryColor: Colors.teal[200],
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.white
    ),
  )
);

class AppTheme {
  static const appBarElevation = 0.0;
  static const titleFontSize = 19.0;

  static const blackBarColor = Color.fromARGB(190, 0, 0, 0);

  static const TextStyle boldFontSmallSize = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const TextStyle boldFontMediumSize = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle heavyFontMediumSize = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 16,
  );

  static const TextStyle lightFontSmall = TextStyle(
      fontSize: 12,
      color: Colors.black45,
  );
}