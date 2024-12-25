

import 'package:flutter/material.dart';

class TaskTypography {
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static TextTheme textTheme = const TextTheme(
    displayLarge: headline1,
    displayMedium: bodyText1,
  );
}