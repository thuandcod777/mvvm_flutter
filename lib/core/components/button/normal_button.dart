import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const NormalButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.all(15),
        elevation: 10,
        onPressed: this.onPressed,
        child: child);
  }
}
