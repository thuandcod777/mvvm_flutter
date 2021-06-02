import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance => _instance = TextThemeLight._init();

  TextThemeLight._init();

  final headline1 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final headline2 =
      TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final headline3 = TextStyle(fontSize: 48, fontWeight: FontWeight.w400);
  final headline4 =
      TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25);
  final headline5 = TextStyle(fontSize: 24, fontWeight: FontWeight.w400);
  final overline =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
