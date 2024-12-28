

import 'package:flutter/material.dart';

class TaskTypography {
  static const String primaryFontFamily = 'Lato';
  static const String secondaryFontFamily = 'National2Condensed';

  static const TextStyle display2Xl = TextStyle(
    fontSize: 72,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle displayXl = TextStyle(
    fontSize: 60,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle displayXlSecondary = TextStyle(
    fontSize: 60,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: secondaryFontFamily,
  );
  static const TextStyle displayLg = TextStyle(
    fontSize: 48,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle displayMd = TextStyle(
    fontSize: 36,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle displaySm = TextStyle(
    fontSize: 32,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle displayXs = TextStyle(
    fontSize: 24,
    height: 1.3,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle displayXsSecondary = TextStyle(
    fontSize: 24,
    height: 1,
    fontFamily: secondaryFontFamily,
  );
  static const TextStyle xl = TextStyle(
    fontSize: 20,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle xlSecondary = TextStyle(
    fontSize: 20,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: secondaryFontFamily,
  );
  static const TextStyle lg = TextStyle(
    fontSize: 18,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle md = TextStyle(
    fontSize: 16,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle sm = TextStyle(
    fontSize: 14,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle xs = TextStyle(
    fontSize: 12,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );
  static const TextStyle xxs = TextStyle(
    fontSize: 10,
    leadingDistribution: TextLeadingDistribution.even,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle font = TextStyle(
    fontFamily: primaryFontFamily,
  );

  static const TextStyle fontSecondary = TextStyle(
    fontFamily: secondaryFontFamily,
  );


  static TextTheme textTheme = const TextTheme(
    displayLarge: displayLg,
    displayMedium: displayMd,
    displaySmall: displaySm,
    bodyMedium: sm,
    bodyLarge: md,
    bodySmall: xs,
  );
}
extension TaskTypographyExtension on TextStyle {
  TextStyle get fontSecondary =>
      copyWith(fontFamily: TaskTypography.secondaryFontFamily);
}