import 'package:flutter/cupertino.dart';
import 'package:mvvm_flutter/core/init/network/icore_dio.dart';
import 'package:mvvm_flutter/core/init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;

  ICoreDioNullSafety? coreDio = NetworkManager.instance!.coreDio;

  void setContext(BuildContext context) {
    this.context = context;
  }

  void init();
}
