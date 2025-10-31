import 'package:film_app/core/constants/app_constants.dart';
import 'package:film_app/core/helper/shared_pref_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool? _userSetMode; 

  Future<void> loadTheme() async {
    final savedTheme = SharedPrefHelper.getBool(AppConstants.isDarkMode);

    if (savedTheme != null) {
      _userSetMode = savedTheme;
      emit(ThemeChangedState(isDark: savedTheme));
    } else {
      final systemDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      emit(ThemeChangedState(isDark: systemDark));
    }
  }

  Future<void> changeThemeMode({bool? sharedMode}) async {
    final newMode = sharedMode ?? !isDark;
    _userSetMode = newMode;
    await SharedPrefHelper.setBool(AppConstants.isDarkMode, newMode);
    emit(ThemeChangedState(isDark: newMode));
  }

  bool get isDark {
    if (state is ThemeChangedState) return (state as ThemeChangedState).isDark;
    return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
  }
}
