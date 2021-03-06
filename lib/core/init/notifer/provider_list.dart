import 'package:mvvm_flutter/core/constants/app/app_constans.dart';
import 'package:mvvm_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_flutter/core/init/notifer/theme_notifer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => ThemeNotifer(),
    ),
    Provider.value(value: NavigationService.instance)
  ];
  List<SingleChildWidget> signleItems = [];
  List<SingleChildWidget> uiChangesItems = [];
}
