import 'package:flutter/material.dart';

class AppThemeLight {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
}
