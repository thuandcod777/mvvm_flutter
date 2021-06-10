import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/constants/enums/app_theme_enum.dart';
import 'package:mvvm_flutter/core/init/theme/app_theme_light.dart';

class ThemeNotifer extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;

  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }
}
