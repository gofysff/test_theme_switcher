import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_theme_switcher/core/themes/app_theme.dart';
import 'package:test_theme_switcher/logic/bloc/theme_bloc.dart';
import 'package:test_theme_switcher/presentation/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: const OurMaterialApp(),
    );
  }
}

class OurMaterialApp extends StatelessWidget {
  const OurMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final currentTheme =
          context.select((ThemeBloc bloc) => bloc.state.themeMode);

      return MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: currentTheme,
        initialRoute: AppRouter.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
    });
  }
}
