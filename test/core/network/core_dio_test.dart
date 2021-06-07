import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_flutter/core/constants/enums/http_request_enum.dart';
import 'package:mvvm_flutter/core/init/network/icore_dio.dart';

import 'core_dio_mock.dart';
import 'dio_mock_model.dart';

main() {
  late ICoreDioFullNulSafetyNull service;
  setUp(() {
    service = CoreDioMock(
        BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));
  });
  test("CoreDio List", () async {
    final data = await service.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test("CoreDio List No Network", () async {
    final data = await service.sendNoNetwork<List<PostModel>, PostModel>(
        '/posts',
        type: HttpTypes.GET,
        parseModel: PostModel());

    expect(data.data, isList);
  });

  test("CoreDio Primitive", () async {
    final data = await service.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());

    expect(data.data, isList);
  });

  test("CoreDio Error", () async {
    final data = await service.sendNoNetwork<List<PostModel>, PostModel>(
        '/posts',
        type: HttpTypes.GET,
        parseModel: PostModel());

    expect(data.data, isList);
  });
}
