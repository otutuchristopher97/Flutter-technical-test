import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const MaterialColor primaryColorSwatch = MaterialColor(
    0xFFFFFFFF, // Base color set to pure white
    <int, Color>{
      25: Color(0xFFFFFFFF),
      50: Color(0xFFFAFAFA),
      100: Color(0xFFF5F5F5),
      200: Color(0xFFE0E0E0),
      300: Color(0xFFBDBDBD),
      400: Color(0xFF9E9E9E),
      500: Color(0xFF757575),
      600: Color(0xFF616161),
      700: Color(0xFF424242),
      800: Color(0xFF212121),
      900: Color(0xFF000000),
    },
  );

  static const MaterialColor successColorSwatch = MaterialColor(
    0xFF0073E6,
    <int, Color>{
      25: Color(0xFFE3F2FD),
      50: Color(0xFFBBDEFB),
      100: Color(0xFF90CAF9),
      200: Color(0xFF64B5F6),
      300: Color(0xFF42A5F5),
      400: Color(0xFF2196F3),
      500: Color(0xFF1E88E5),
      600: Color(0xFF0073E6),
      700: Color(0xFF01579B),
      800: Color(0xFF003865),
      900: Color(0xFF00274D),
    },
  );

  static Color primaryColor = Colors.white;
  static const Color accentColor = Color.fromARGB(255, 52, 51, 55);
  static const Color greyColor = Color(0xFF667085);
  static const Color greyLightColor = Color(0xFFD0D5DD);
  static const Color blackTextColor = Color(0xFF0F1419);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static Color backgroundColor = primaryColor;
  static const Color warningColor = Color(0xFFF79009);
  static Color errorColor = Colors.red;
  static Color successColor = successColorSwatch.shade700;
  static Color transparentColor = Colors.transparent;
  
  static Color buttonColor = successColorSwatch.shade700;
}
