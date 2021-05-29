import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/init/notifer/theme_notifer.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  BuildContext context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void chageTheme() {
    Provider.of<ThemeNotifer>(context, listen: false);
  }
}
