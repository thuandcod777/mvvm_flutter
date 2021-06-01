import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/model/base_view_model.dart';
import 'package:mvvm_flutter/core/constants/enums/app_theme_enum.dart';
import 'package:mvvm_flutter/core/constants/enums/http_request_enum.dart';
import 'package:mvvm_flutter/core/init/network/core_dio.dart';
import 'package:mvvm_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_flutter/core/init/notifer/theme_notifer.dart';
import 'package:mvvm_flutter/core/init/theme/app_theme.dart';
import 'package:mvvm_flutter/view/authenticate/test/model/test_model.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    super.setContext(context);
  }

  @override
  void init() {}

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void chageTheme() {
    Provider.of<ThemeNotifer>(context!, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    final response = await coreDio!.send<List<TestModel>, TestModel>('x',
        type: HttpTypes.GET, parseModel: TestModel());

    if (response.data is List<TestModel>) {
    } else {
      isLoading = false;
    }
  }
}
