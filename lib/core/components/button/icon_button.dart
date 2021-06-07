import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/button/normal_button.dart';

class IconNormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const IconNormalButton(
      {Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NormalButton(
      onPressed: this.onPressed,
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
