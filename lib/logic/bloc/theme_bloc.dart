import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test_theme_switcher/core/themes/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeChangedEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(ThemeMode.light)) {
    on<ThemeChangedEvent>(
      (event, emit) {
        AppTheme.setStatusBarAndNavigationBarColors(state.themeMode);
        // emitting new state with opposite theme mode
        emit(ThemeMode.light == state.themeMode
            ? const ThemeState(ThemeMode.dark)
            : const ThemeState(ThemeMode.light));
      },
    );
  }
}
