import 'package:dio/dio.dart';
import 'package:mvvm_flutter/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_flutter/core/init/cache/locale_manager.dart';
import 'package:mvvm_flutter/core/init/network/core_dio.dart';
import 'package:mvvm_flutter/core/init/network/icore_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com/",
      headers: {
        "val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)
      },
    );
    coreDio = CoreDio(baseOptions);
  }
}
