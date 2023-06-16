// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);

  bool get isLightTheme => themeMode == ThemeMode.light;

  @override
  List<Object?> get props => [themeMode];
}
