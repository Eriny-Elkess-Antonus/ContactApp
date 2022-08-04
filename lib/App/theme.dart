// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

abstract class AppColors {
  static const primary = Colors.purple;
  static const error = Color(0xFFFF0033);
  static const background = Color(0xFFEFEFEF);
}

abstract class AppDimens {
  static const pagePadding = EdgeInsets.all(15);
  static const cardPadding = EdgeInsets.all(14);
  static const itemSepatator = SizedBox.square(dimension: 12);
}

class AppTheme {
  ThemeData get data => ThemeData(
        fontFamily: 'Almarai',
        visualDensity: VisualDensity.adaptivePlatformDensity,

        // Colors
        primaryColor: AppColors.primary,
        primaryColorBrightness: Brightness.dark,
        backgroundColor: AppColors.background,
        errorColor: AppColors.error,
        toggleableActiveColor: AppColors.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          error: AppColors.error,
          background: AppColors.background,
        ),

        // AppBar
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
          centerTitle: true,
        ),

        // Card
        cardTheme: CardTheme(
          elevation: 6,
          margin: EdgeInsets.zero,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        // TextField
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: const TextStyle(
            color: Colors.black38,
          ),
          errorStyle: const TextStyle(
            color: AppColors.error,
            fontSize: 13,
          ),
        ),
      );
}
