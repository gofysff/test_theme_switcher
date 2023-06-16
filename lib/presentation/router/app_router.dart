import 'package:flutter/material.dart';
import 'package:test_theme_switcher/core/exceptions/route_exception.dart';
import 'package:test_theme_switcher/presentation/screens/show_result_screen/show_result_screen.dart';
import 'package:test_theme_switcher/presentation/screens/switcher_screen/switcher_screen.dart';

class AppRouter {
  static const home = "/";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const SwitcherScreen());
      case ShowResultScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ShowResultScreen());
      default:
        throw const RouteException("Route not found");
    }
  }
}
