import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  scaffoldBackgroundColor: backgroundColor,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColor),
    bodyMedium: TextStyle(color: textColor),
    bodySmall: TextStyle(color: textColor),
    displayLarge: TextStyle(color: textColor),
    displayMedium: TextStyle(color: textColor),
    displaySmall: TextStyle(color: textColor),
    titleLarge: TextStyle(color: textColor),
    titleMedium: TextStyle(color: textColor),
    titleSmall: TextStyle(color: textColor),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return textDisabledColor;
        }
        return textColor;
      }),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) {
          return textDisabledColor;
        }
        return textColor;
      }),
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(
      color: textColor,
    ),
  ),
  cardTheme: CardThemeData(
    margin: EdgeInsets.zero,
    color: backgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    insetPadding: EdgeInsets.zero,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: backgroundLightColor,
    hintStyle: const TextStyle(color: textDisabledColor),
    labelStyle: const TextStyle(color: textDisabledColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: backgroundLightColor,
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: primaryColor,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 8,
  ),
);