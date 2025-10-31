import 'package:film_app/core/utils/color_theme_extension.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    extensions: const <ThemeExtension<dynamic>>[ColorThemeExtension.light],
  );

  static ThemeData darkTheme = ThemeData(
    extensions: const <ThemeExtension<dynamic>>[ColorThemeExtension.dark],
  );
}
