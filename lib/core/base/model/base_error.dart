import 'package:mvvm_flutter/core/init/network/iresponse_model.dart';
import 'package:provider/provider.dart';

class BaseError extends IErrorModel {
  final String message;
  BaseError(this.message);
}
