import 'package:components/themes/task_typography.dart';
import 'package:flutter/material.dart';

import 'color_scheme.dart';

class TaskTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Lato',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryVariant,
      secondary: AppColors.secondary,
      background: AppColors.background,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackground,
      onSurface: AppColors.onSurface,
      onError: AppColors.onError,
    ),
    textTheme: TaskTypography.textTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Lato',
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryVariant,
      secondary: AppColors.secondary,
      background: AppColors.background,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onBackground: AppColors.onBackground,
      onSurface: AppColors.onSurface,
      onError: AppColors.onError,
    ),
    textTheme: TaskTypography.textTheme.copyWith(
      bodyLarge: TaskTypography.bodyText1.copyWith(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryVariant,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.onPrimary,
      ),
    ),
  );
}
