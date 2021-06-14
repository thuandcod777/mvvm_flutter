import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/constants/app/app_constans.dart';
import 'package:mvvm_flutter/core/init/cache/locale_manager.dart';
import 'package:mvvm_flutter/core/init/lang/language_manager.dart';
import 'package:mvvm_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_flutter/core/init/navigation/navigator_route.dart';
import 'package:mvvm_flutter/core/init/notifer/provider_list.dart';
import 'package:mvvm_flutter/core/init/notifer/theme_notifer.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/view/build_feed_view.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/view/social_view.dart';
import 'package:mvvm_flutter/view/authenticate/login/view/login_view.dart';
import 'package:provider/provider.dart';

void main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      child: MyApp(),
      supportedLocales: LanguageManager.instance.supportLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
      startLocale: LanguageManager.instance.enLocale,
    ),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.preferencesInit();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifer>(context, listen: false).currentTheme,
      home: SocialView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigatorRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
