import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_theme_switcher/logic/bloc/theme_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Theme bloc tests', () {
    late ThemeBloc bloc;
    setUp(() => bloc = ThemeBloc());

    tearDown(() => bloc.close());

    test("Initial value is Light", () {
      expect(bloc.state.isLightTheme, true);
    });

    test("value is changing after adding event", () async {
      final initialValue = bloc.state.isLightTheme;
      bloc.add(ThemeChangedEvent());
      await Future.delayed(const Duration(milliseconds: 10));
      final changedValue = bloc.state.isLightTheme;
      expect(initialValue != changedValue, true);
    });
  });
}
