import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/button/normal_button.dart';

class TitleTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const TitleTextButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: this.onPressed,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
