import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pomodrive/core/theme/colors/app_colors.dart';
import 'package:pomodrive/core/theme/styles/app_text_styles.dart';

/// Base theme configuration shared between light and dark themes
ThemeData _createBaseTheme({
  required Brightness brightness,
  required Color backgroundColor,
  required Color primaryTextColor,
  required Color secondaryTextColor,
}) {
  final baseTextTheme = TextTheme(
    displayLarge: AppTextStyles.displayLargeStyle.copyWith(
      color: primaryTextColor,
    ),
    headlineLarge: AppTextStyles.headlineLargeStyle.copyWith(
      color: primaryTextColor,
    ),
    titleMedium: AppTextStyles.titleMediumStyle.copyWith(
      color: primaryTextColor,
    ),
    labelLarge: AppTextStyles.labelLargeStyle.copyWith(color: primaryTextColor),
    bodyMedium: AppTextStyles.bodyMediumStyle.copyWith(
      color: secondaryTextColor,
    ),
    bodySmall: AppTextStyles.bodySmallStyle.copyWith(color: secondaryTextColor),
  );

  return ThemeData(
    brightness: brightness,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: AppColorPalette.red,
    textTheme: baseTextTheme,
    appBarTheme: AppBarTheme(backgroundColor: backgroundColor),
    useMaterial3: true, // Enable Material 3 design
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorPalette.red,
      brightness: brightness,
    ),
  );
}

/// Base Cupertino theme configuration shared between light and dark themes
CupertinoThemeData _createBaseCupertinoTheme({
  required Brightness brightness,
  required Color backgroundColor,
  required Color primaryTextColor,
}) {
  return CupertinoThemeData(
    brightness: brightness,
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: AppColorPalette.red,
    barBackgroundColor: backgroundColor,
    textTheme: CupertinoTextThemeData(
      navLargeTitleTextStyle: AppTextStyles.navLargeTitleStyle.copyWith(
        color: primaryTextColor,
      ),
      textStyle: AppTextStyles.cupertinoBodyStyle.copyWith(
        color: primaryTextColor,
      ),
      actionTextStyle: AppTextStyles.cupertinoActionStyle.copyWith(
        color: AppColorPalette.red,
      ),
    ),
  );
}

/// Light theme configuration
final lightMaterialTheme = _createBaseTheme(
  brightness: Brightness.light,
  backgroundColor: AppColorPalette.lightBackground,
  primaryTextColor: AppColorPalette.lightPrimaryText,
  secondaryTextColor: AppColorPalette.lightSecondaryText,
);

/// Dark theme configuration
final darkMaterialTheme = _createBaseTheme(
  brightness: Brightness.dark,
  backgroundColor: AppColorPalette.darkBackground,
  primaryTextColor: AppColorPalette.darkPrimaryText,
  secondaryTextColor: AppColorPalette.darkSecondaryText,
);

/// Light Cupertino theme configuration
final lightCupertinoTheme = _createBaseCupertinoTheme(
  brightness: Brightness.light,
  backgroundColor: AppColorPalette.lightBackground,
  primaryTextColor: AppColorPalette.lightPrimaryText,
);

/// Dark Cupertino theme configuration
final darkCupertinoTheme = _createBaseCupertinoTheme(
  brightness: Brightness.dark,
  backgroundColor: AppColorPalette.darkBackground,
  primaryTextColor: AppColorPalette.darkPrimaryText,
);
