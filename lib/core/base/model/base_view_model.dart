import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/init/cache/locale_manager.dart';
import 'package:mvvm_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_flutter/core/init/network/icore_dio.dart';
import 'package:mvvm_flutter/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;
  LocaleManager localeManager = LocaleManager.instance;
  NavigationService navigationService = NavigationService.instance;

  void setContext(BuildContext context) {}

  void init();
}
