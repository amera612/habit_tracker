import 'package:flutter/material.dart';

import 'constant.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryClr,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryClr,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkGreyClr,
    scaffoldBackgroundColor: darkGreyClr,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGreyClr,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
  );
}
