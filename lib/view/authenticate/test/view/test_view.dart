import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/base/state/base_state.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(0.1),
      child: Placeholder(),
    );
  }
}
