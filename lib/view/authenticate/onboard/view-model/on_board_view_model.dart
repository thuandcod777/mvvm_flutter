import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/model/base_view_model.dart';
import 'package:mvvm_flutter/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_flutter/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_flutter/core/constants/navigation/navigator_constants.dart';
import 'package:mvvm_flutter/view/_product/_constants/image_path_svg.dart';
import 'package:mvvm_flutter/view/authenticate/onboard/model/on_board_model.dart';
import 'package:mvvm_flutter/core/extension/string_extension.dart';
part 'on_board_view_model.g.dart';

class OnBoardViewModel = _OnBoardViewModelBase with _$OnBoardViewModel;

abstract class _OnBoardViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  bool isLoading = false;

  @override
  void init() {
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page1_title.locale,
        LocaleKeys.onBoard_page1_desc, SVGImagePaths.instance.astroautSVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page2_title.locale,
        LocaleKeys.onBoard_page2_desc, SVGImagePaths.instance.relaxSVG));
    onBoardItems.add(OnBoardModel(LocaleKeys.onBoard_page3_title.locale,
        LocaleKeys.onBoard_page3_desc, SVGImagePaths.instance.chattingSVG));
  }

  late List<OnBoardModel> onBoardItems = [];

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  int currentIndex = 0;

  @action
  void changeCurrentIndex(int value) {
    currentIndex = value;
  }

  Future<void> completeToOnBoard() async {
    changeLoading();
    await localeManager.setBoolValue(PreferencesKeys.IS_FIRST_APP, true);
    changeLoading();

    navigationService.navigatorToPageClear(path: NavigatorConstants.TEST_VIEW);
  }
}
