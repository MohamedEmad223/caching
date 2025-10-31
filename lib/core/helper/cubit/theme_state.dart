part of 'theme_cubit.dart';


sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}


final class ThemeChangedState extends ThemeState {
  final bool isDark;

  ThemeChangedState({required this.isDark});
}
