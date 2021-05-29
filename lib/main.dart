import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/constants/app/app_constans.dart';
import 'package:mvvm_flutter/core/init/lang/language_manager.dart';
import 'package:mvvm_flutter/core/init/notifer/theme_notifer.dart';
import 'package:mvvm_flutter/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: LanguageManager.instance.supportLocales,
    path: ApplicationConstants.LANG_ASSET_PATH,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        theme: Provider.of<ThemeNotifer>(context, listen: false).currentTheme,
        home: TestView(),
      ),
    );
  }
}
