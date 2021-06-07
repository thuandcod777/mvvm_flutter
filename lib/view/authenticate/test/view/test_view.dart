import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_flutter/core/base/state/base_state.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_flutter/core/init/cache/locale_manager.dart';
import 'package:mvvm_flutter/core/init/lang/language_manager.dart';
import 'package:mvvm_flutter/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_flutter/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:mvvm_flutter/core/extension/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm_flutter/core/constants/enums/locale_keys_enum.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
        viewModel: TestViewModel(),
        onModelReady: (model) {
          viewModel = model;
        },
        onPageBuilder: (context, value) => Text("data"));
  }

  Widget get scraffolBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButton(),
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading:
          Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget(),
      actions: [iconButtonChangeTheme()],
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonChangeTheme() {
    return IconButton(
        icon: Icon(Icons.change_history),
        onPressed: () {
          context.locale = LanguageManager.instance.enLocale;
        });
  }

  Widget get textNumber {
    return Observer(builder: (context) => Text(viewModel!.number.toString()));
  }

  FloatingActionButton floatingActionButton() =>
      FloatingActionButton(onPressed: () => viewModel!.incrementNumber());
}

extension _FormArea on _TestViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) => value!.isValidEmail,
      );
}
