import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_theme_switcher/logic/bloc/theme_bloc.dart';
import 'res.dart';

class ShowResultScreen extends StatelessWidget {
  const ShowResultScreen({super.key});

  static const routeName = "/show_result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _appBar,
      body: _body,
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: const Text(appBarText),
    );
  }

  Widget get _body =>
      BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
        final text = switch (state.isLightTheme) {
          true => helloWorldText,
          false => byeWorldText,
        };

        return Center(
          child: Text(text, style: const TextStyle(fontSize: 20)),
        );
      });
}
