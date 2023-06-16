import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_theme_switcher/logic/bloc/theme_bloc.dart';
import 'package:test_theme_switcher/logic/loggers/theme_logger.dart';
import 'package:test_theme_switcher/presentation/screens/show_result_screen/show_result_screen.dart';
import 'package:test_theme_switcher/presentation/screens/switcher_screen/res.dart';

class SwitcherScreen extends StatefulWidget {
  const SwitcherScreen({super.key});

  @override
  State<SwitcherScreen> createState() => _SwitcherScreenState();
}

class _SwitcherScreenState extends State<SwitcherScreen> {
  final _logger = ThemeLogger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _body,
      floatingActionButton: _getFloatingActionButton(context),
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: const Text(appBarText),
    );
  }

  Center get _body {
    return Center(
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Column(
            children: [
              _getSwitcher(context, state),
              _getLogs(),
            ],
          );
        },
      ),
    );
  }

  Expanded _getLogs() {
    return Expanded(
      child: ExpansionTile(
        title: Text('$logsText (${_logger.logs.length})'),
        children: [
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Text(_logger.logs.join('\n')),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _getSwitcher(BuildContext context, ThemeState state) {
    return Expanded(
      child: Switch(
        thumbIcon: thumbIcon,
        onChanged: (value) {
          context.read<ThemeBloc>().add(ThemeChangedEvent());
          _logger.addLog(value);
        },
        value: state.isLightTheme,
      ),
    );
  }

  Widget _getFloatingActionButton(BuildContext context) =>
      FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(ShowResultScreen.routeName);
        },
        label: const Text(toNextScreenText),
      );

  MaterialStateProperty<Icon?> get thumbIcon =>
      MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const Icon(Icons.check);
          }
          return const Icon(Icons.close);
        },
      );
}
