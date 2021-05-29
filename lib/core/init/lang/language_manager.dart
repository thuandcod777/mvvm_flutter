import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instance;
  static LanguageManager get instance {
    if (_instance == null) _instance = LanguageManager._init();
  }

  LanguageManager._init();

  final enLocale = Locale("en", "US");

  List<Locale> get supportLocales => [enLocale];
}
