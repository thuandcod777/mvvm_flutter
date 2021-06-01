abstract class IResponseModel<T> {
  T? data;
  IErrorModel? error;
}

abstract class IErrorModel<T> {
  void statusCode() {}
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  T? data;
  @override
  IErrorModel? error;

  ResponseModel({this.data, this.error});
}
