import 'package:flutter/material.dart';

/// Text styles configuration for the application
/// Contains both Material and Cupertino text styles
class AppTextStyles {
  const AppTextStyles._();

  // Material styles
  static const displayLargeStyle = TextStyle(
    fontSize: 56,
    fontWeight: FontWeight.bold,
  );

  static const headlineLargeStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const titleMediumStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const labelLargeStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const bodyMediumStyle = TextStyle(fontSize: 14);
  static const bodySmallStyle = TextStyle(fontSize: 12);

  // Cupertino styles
  static const navLargeTitleStyle = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
  );

  static const cupertinoBodyStyle = TextStyle(fontSize: 17);

  static const cupertinoActionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}
