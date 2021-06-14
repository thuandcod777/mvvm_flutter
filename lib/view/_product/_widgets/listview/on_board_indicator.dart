import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/list-view/indicator_list_view.dart';

class OnBoardIndicator extends StatelessWidget {
  final int? itemCount;
  final int? currentIndex;

  const OnBoardIndicator({Key? key, this.itemCount, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndicatorListViews(
      currentIndex: currentIndex,
      itemCount: itemCount,
      onListItem: (int index) {
        return FlutterLogo();
      },
    );
  }
}
