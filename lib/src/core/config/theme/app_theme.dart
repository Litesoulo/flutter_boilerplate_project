import 'package:flutter/material.dart';

import '../../../../../generated/fonts.gen.dart';
import '../../../di/service_locator.dart';
import '../constants/dimens.dart';

abstract final class AppThemeData {
  const AppThemeData._();

  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      fontFamily: FontFamily.comfortaa,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFFd21e1d),
    primaryContainer: Color(0xFF9e1718),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFE6EBEB),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w500;
  static const _medium = FontWeight.w700;
  static const _bold = FontWeight.w900;

  static final TextTheme _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 3.4,
      fontWeight: _bold, // Bold for prominent headlines
    ),
    headlineMedium: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 2.8,
      fontWeight: _bold, // Bold for subheadings
    ),
    headlineSmall: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 2.4,
      fontWeight: _medium, // Medium for smaller headings
    ),
    titleLarge: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 2.2,
      fontWeight: _medium, // Medium for section titles
    ),
    titleMedium: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.8,
      fontWeight: _medium, // Medium for smaller titles
    ),
    titleSmall: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.6,
      fontWeight: _regular, // Regular for subtle titles
    ),
    bodyLarge: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.6,
      fontWeight: _regular, // Regular for body text
    ),
    bodyMedium: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.4,
      fontWeight: _regular, // Regular for body text
    ),
    bodySmall: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.2,
      fontWeight: _regular, // Regular for smaller body text
    ),
    labelLarge: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.4,
      fontWeight: _medium, // Medium for prominent labels
    ),
    labelMedium: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase * 1.2,
      fontWeight: _regular, // Regular for standard labels
    ),
    labelSmall: TextStyle(
      fontSize: sl<Dimens>().fontSizeBase,
      fontWeight: _regular, // Regular for small labels
    ),
  );
}
