import 'package:intl/intl.dart';

class ThemeLogger {
  final List<String> logs = [];

  void addLog(bool isLightTheme) {
    String time = DateFormat('HH:mm:ss').format(DateTime.now());
    String action = switch (isLightTheme) {
      false => "changed from light to dark",
      true => "changed from dark to light"
    };
    String log = '$action at $time';
    logs.add(log);
  }
}
