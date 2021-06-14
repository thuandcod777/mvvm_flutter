abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  int? statusCode;
  String? description;
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  T? data;
  @override
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}
