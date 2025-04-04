import 'package:flutter/material.dart';
import 'package:pomodrive/core/theme/colors/app_colors.dart';

/// Extension on ThemeData to easily access custom colors
extension AppColorsTheme on ThemeData {
  /// Background color based on theme brightness
  Color get background =>
      brightness == Brightness.light
          ? AppColorPalette.lightBackground
          : AppColorPalette.darkBackground;

  /// Primary text color based on theme brightness
  Color get primaryText =>
      brightness == Brightness.light
          ? AppColorPalette.lightPrimaryText
          : AppColorPalette.darkPrimaryText;

  /// Secondary text color based on theme brightness
  Color get secondaryText =>
      brightness == Brightness.light
          ? AppColorPalette.lightSecondaryText
          : AppColorPalette.darkSecondaryText;

  /// Primary accent color (constant regardless of theme)
  Color get primaryAccent => AppColorPalette.red;

  /// Timer ring color based on theme brightness
  Color get timerRing =>
      brightness == Brightness.light
          ? AppColorPalette.lightTimerRing
          : AppColorPalette.darkTimerRing;

  /// Button background color (constant regardless of theme)
  Color get buttonBackground => AppColorPalette.red;

  /// Button text color (constant regardless of theme)
  Color get buttonText => AppColorPalette.white;

  /// Border color based on theme brightness
  Color get border =>
      brightness == Brightness.light
          ? AppColorPalette.lightBorder
          : AppColorPalette.darkBorder;

  Color get appBarBackground =>
      brightness == Brightness.light
          ? AppColorPalette.lightBackground
          : AppColorPalette.darkBackground;
}
