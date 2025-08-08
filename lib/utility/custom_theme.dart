import 'package:flutter/material.dart';
import 'color_helper.dart';

class CustomTheme {
  /// Light Theme
  static final lightTheme = ThemeData(
    primaryColor: ColorHelper.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    fontFamily: 'WorkSans',
    scaffoldBackgroundColor: const Color(0xFFE9EAF0),
    // useMaterial3: false,
    // colorScheme: ColorScheme.light(
    //   brightness: Brightness.light,
    //   primary: ColorPicker.kPrimaryBlueColor,
    //
    //   /// Scroll End Color
    //   secondary: ColorPicker.kPrimaryBlueColor,
    // ),
  );

  /// Dark Theme
  static final darkTheme = ThemeData(
    primaryColor: ColorHelper.blue,
    fontFamily: 'WorkSans',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF202020),
    ),
    scaffoldBackgroundColor: const Color(0xFF262626),
    // useMaterial3: false,
    // colorScheme: ColorScheme.dark(
    //   brightness: Brightness.dark,
    //   primary: ColorPicker.kPrimaryBlueColor,
    //
    //   /// Scroll End Color
    //   secondary: ColorPicker.kPrimaryBlueColor,
    // ),
  );
}
