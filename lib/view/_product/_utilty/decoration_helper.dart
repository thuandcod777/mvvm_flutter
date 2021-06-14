import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/decoration/circle_decoration.dart';

class DecorationHelper {
  BuildContext? context;
  DecorationHelper({
    this.context,
  });

  final circleDecoration = CircleDecoration(color: Colors.red, radius: 3);
}
