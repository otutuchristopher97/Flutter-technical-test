import 'package:flutter/material.dart';
import 'package:flutter_tech_task/core/resources/app_colors.dart';

ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: AppColors.primaryColor,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
      headlineLarge: TextStyle(fontSize: 20, color: Colors.black87),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primary: AppColors.primaryColor,
        secondary: AppColors.greyColor),
    primarySwatch: AppColors.primaryColorSwatch,
    fontFamily: 'Inter');
