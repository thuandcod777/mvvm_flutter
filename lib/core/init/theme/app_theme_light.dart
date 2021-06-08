import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/constants/app/app_constans.dart';
import 'package:mvvm_flutter/core/init/theme/app_theme.dart';
import 'package:mvvm_flutter/core/init/theme/light/text_theme_light.dart';
import 'package:mvvm_flutter/core/init/theme/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;

  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
      fontFamily: ApplicationConstants.FONT_FAMMILY,
      colorScheme: _appColorScheme(),
      textTheme: textTheme(),
      floatingActionButtonTheme:
          ThemeData.light().floatingActionButtonTheme.copyWith(),
      tabBarTheme: tabBarTheme());

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
        labelPadding: insets.lowPaddingAll,
        unselectedLabelStyle:
            textThemeLight.headline4.copyWith(color: colorSchemeLight.red));
  }

  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        overline: textThemeLight.overline);
  }

  ColorScheme _appColorScheme() {
    return ColorScheme(
        primary: colorSchemeLight.black,
        primaryVariant: Colors.white,
        secondary: Colors.green,
        secondaryVariant: colorSchemeLight.azune,
        surface: Colors.blue,
        background: Colors.white,
        error: Colors.red.shade900,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black38,
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Colors.red,
        brightness: Brightness.light);
  }
}
