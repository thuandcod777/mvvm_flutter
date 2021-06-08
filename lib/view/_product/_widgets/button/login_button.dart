import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/button/icon_button.dart';

class LoginButton extends StatelessWidget {
  final Function(String data) onComplete;
  const LoginButton({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconNormalButton(
      icon: Icons.access_alarm,
      onPressed: () {
        onComplete("OKEY");
      },
    );
  }
}
