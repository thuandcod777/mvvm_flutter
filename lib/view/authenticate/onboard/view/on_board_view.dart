import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/core/components/column/form_column.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';
import 'package:mvvm_flutter/view/_widgets/listview/on_board_indicator.dart';
import 'package:mvvm_flutter/view/authenticate/onboard/view-model/on_board_view_model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late OnBoardViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel value) => Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 9,
              child: buildPageView(),
            ),
            Expanded(child: buildObserverIndcator()),
          ],
        ),
      ),
    );
  }

  PageView buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.onPageChanged(value);
      },
      itemCount: viewModel.onBoardModel.length,
      itemBuilder: (context, index) => Container(
        color: context.randomColor,
        child: FormColumn(
          children: [Placeholder(), Text(viewModel.onBoardModel[index].title)],
        ),
      ),
    );
  }

  Observer buildObserverIndcator() {
    return Observer(
        builder: (_) => OnBoardIndicator(
              itemCount: viewModel.onBoardModel.length,
              currentIndex: viewModel.currentPageIndex,
            ));
  }
}
