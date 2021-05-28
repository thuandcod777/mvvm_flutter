import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_flutter/core/base/state/base_state.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:mobx/mobx.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel viewModel;
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
        floatingActionButton: floatingActionButton(),
        body: textNumber,
      );

  Widget get textNumber {
    return Observer(builder: (context) => Text(viewModel.number.toString()));
  }

  FloatingActionButton floatingActionButton() =>
      FloatingActionButton(onPressed: () => viewModel.incrementNumber());
}
