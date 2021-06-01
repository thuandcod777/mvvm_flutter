import 'package:dio/dio.dart';
import 'package:mvvm_flutter/core/base/model/base_error.dart';
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

  /*Future<void> dioGet<T extends BaseModel>(String path, T model) async {
    final response = await dio.get(path);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final responeBody = response.data;
        if (responeBody is List) {
          return responeBody.map((e) => model.fromJson(e)).toList();
        } else if (responeBody is Map) {
          return model.fromJson(responeBody);
        }
        return responeBody;
        break;

      default:
    }
  }*/
}
