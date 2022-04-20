import 'package:flutter/material.dart';
import 'package:simple_tic_tac_toe/utils/export_utils.dart';

class ThemeConfig {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: FontConfig.family,
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorConfig.lightTheme1,
        secondary: ColorConfig.lightTheme2,
      ),
      scaffoldBackgroundColor: ColorConfig.lightTheme1,
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      fontFamily: FontConfig.family,
      colorScheme: const ColorScheme.dark().copyWith(
        primary: ColorConfig.darkTheme1,
        secondary: ColorConfig.darkTheme2,
      ),
      scaffoldBackgroundColor: ColorConfig.darkTheme1,
    );
  }
}
