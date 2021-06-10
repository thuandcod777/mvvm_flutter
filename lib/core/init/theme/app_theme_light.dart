import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/constants/app/app_constans.dart';
import 'package:mvvm_flutter/core/init/theme/app_theme.dart';
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
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.red)),
      scaffoldBackgroundColor: Color(0xfff1f3f8),
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme(),
      floatingActionButtonTheme:
          ThemeData.light().floatingActionButtonTheme.copyWith(),
      tabBarTheme: tabBarTheme());

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
        focusColor: Colors.black12,
        labelStyle: TextStyle(),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)));
  }

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
        labelPadding: insets.lowPaddingAll,
        labelColor: _appColorScheme().onSecondary,
        labelStyle: textThemeLight.headline4,
        unselectedLabelColor: _appColorScheme().onSecondary.withOpacity(0.2),
        unselectedLabelStyle:
            textThemeLight.headline4.copyWith(color: colorSchemeLight.red));
  }

  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        headline5: textThemeLight.headline5,
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
        onError: Color(0xffffc93c),
        brightness: Brightness.light);
  }
}
