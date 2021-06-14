import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/button/title_text_button.dart';

class FaceBookButton extends StatelessWidget {
  final Function(FaceBookModel? data, {String? errorMessage})? onComplete;
  const FaceBookButton({Key? key, required this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: "Facebook Login",
      onPressed: () {
        final isLengthSixCharacter = "asdasdasd".length == 6;
        if (isLengthSixCharacter) {
          onComplete!(FaceBookModel("asdsad", "messi777@gmail.com"));
        } else {
          onComplete!(null, errorMessage: "Facebook user not found");
        }
      },
    );
  }
}

class FaceBookModel {
  final String token;
  final String mail;

  FaceBookModel(this.token, this.mail);
}
