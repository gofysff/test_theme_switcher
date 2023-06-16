import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(useMaterial3: true);

  static final darkTheme = ThemeData.dark().copyWith(useMaterial3: true);

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    late final SystemUiOverlayStyle systemUiOverlay;

    if (themeMode == ThemeMode.light) {
      systemUiOverlay = SystemUiOverlayStyle.light;
    } else {
      systemUiOverlay = SystemUiOverlayStyle.dark;
    }

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlay);
  }
}
