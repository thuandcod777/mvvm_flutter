import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';
import 'package:mvvm_flutter/view/_product/_widgets/avatar/on_board_circle.dart';
import 'package:mvvm_flutter/view/authenticate/onboard/model/on_board_model.dart';
import 'package:mvvm_flutter/view/authenticate/onboard/view-model/on_board_view_model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, OnBoardViewModel viewModel) =>
          Scaffold(
        body: Padding(
          padding: context.paddingLowHorizontal,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 5,
                child: buildPageView(viewModel),
              ),
              Expanded(
                flex: 2,
                child: buildRowFooter(context, viewModel),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildRowFooter(BuildContext context, OnBoardViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: buildListViewCircle(context, viewModel),
        ),
        Expanded(
          child: Center(
              child: Visibility(
                  visible: viewModel.isLoading,
                  child: CircularProgressIndicator())),
        ),
        buildFloatingActionButtonSkip(context, viewModel)
      ],
    );
  }

  ListView buildListViewCircle(
      BuildContext context, OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      padding: context.paddingLow,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Padding(
            padding: context.paddingLow,
            child: Observer(builder: (_) {
              return SizedBox(
                width: context.width * 0.08,
                child: OnBoardCircle(
                  isSelected: viewModel.currentIndex == index,
                ),
              );
            }));
      },
    );
  }

  FloatingActionButton buildFloatingActionButtonSkip(
      BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
        backgroundColor: context.colors.secondaryVariant,
        child: Icon(
          Icons.keyboard_arrow_right,
          color: context.colors.primaryVariant,
        ),
        onPressed: () {
          viewModel.completeToOnBoard();
        });
  }

  PageView buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        itemCount: viewModel.onBoardItems.length,
        onPageChanged: (value) {
          viewModel.changeCurrentIndex(value);
        },
        itemBuilder: (context, index) =>
            buildColumnBody(context, viewModel.onBoardItems[index]));
  }

  Column buildColumnBody(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: buildSvgPicture(model.imagePath)),
        buildColumnDecription(context, model),
      ],
    );
  }

  SvgPicture buildSvgPicture(String path) => SvgPicture.asset(path);

  Column buildColumnDecription(BuildContext context, OnBoardModel model) {
    return Column(children: [
      AutoSizeText(
        "Make It Good",
        style: Theme.of(context).textTheme.headline3!.copyWith(
            fontWeight: FontWeight.bold, color: context.colors.secondary),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: AutoSizeText(
          "You are not alone.You have unique abiltiyto go to anther world",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w100),
        ),
      )
    ]);
  }

  /*PageView buildPageView() {
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
  }*/
}
