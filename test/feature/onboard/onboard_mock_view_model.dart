import 'package:dio/dio.dart';
import 'package:mvvm_flutter/core/constants/enums/http_request_enum.dart';
import 'package:mvvm_flutter/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_flutter/core/constants/navigation/navigator_constants.dart';
import 'package:mvvm_flutter/core/init/cache/locale_manager.dart';
import 'package:mvvm_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_flutter/core/init/network/core_dio.dart';
import 'package:mvvm_flutter/view/authenticate/onboard/model/on_board_model.dart';
import 'package:mvvm_flutter/core/init/network/icore_dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvvm_flutter/view/authenticate/onboard/view-model/on_board_view_model.dart';

import '../../core/network/dio_mock_model.dart';

class OnBoardMockViewModel implements OnBoardViewModel {
  @override
  BuildContext? context;

  @override
  ICoreDioNullSafety? coreDio;

  late IStringHelper stringHelper;

  bool isLoading = false;

  @override
  late int currentIndex;

  @override
  late List<OnBoardModel> onBoardItems = [];

  @override
  void init() {
    coreDio =
        CoreDio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
    stringHelper = MockStringHelper();
  }

  @override
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  Future<void> onBoardGetModels() async {
    final response = await coreDio!.send<List<PostModel>, PostModel>('/posts',
        type: HttpTypes.GET, parseModel: PostModel());

    if (response.data is List) {
      onBoardItems = response.data!
          .map((e) => OnBoardModel(
                stringHelper.toUpper(e.title!),
                e.imagePath!,
                e.description!,
              ))
          .toList()
          .cast<OnBoardModel>();
    }
  }

  Future<void> getServiceRequest() async {
    isLoading = true;
    await onBoardGetModels();
    isLoading = false;
  }

  @override
  void setContext(BuildContext context) {}

  @override
  late LocaleManager localeManager;

  @override
  late NavigationService navigationService;

  @override
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();

    navigationService.navigatorToPageClear(path: NavigatorConstants.TEST_VIEW);
  }
}

abstract class IStringHelper {
  String toUpper(String data);
}

class MockStringHelper extends IStringHelper {
  @override
  String toUpper(String data) {
    return data.toUpperCase();
  }
}
