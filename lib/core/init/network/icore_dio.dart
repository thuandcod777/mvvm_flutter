import 'package:mvvm_flutter/core/base/model/base_model.dart';
import 'package:mvvm_flutter/core/constants/enums/http_request_enum.dart';
import 'package:mvvm_flutter/core/init/network/iresponse_model.dart';

abstract class ICoreDioNullSafety {
  Future<IResponseModel<R>> send<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      dynamic data,
      Map<String, Object>? queryParameters,
      void Function(int, int)? onReceiveProgress});
}
