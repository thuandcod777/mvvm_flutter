import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/view/_product/_widgets/button/face_book_button.dart';
import 'package:mvvm_flutter/view/_product/_widgets/button/login_button.dart';
import 'package:mvvm_flutter/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';

class LoginView extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10.0,
          ),
          LoginButton(
            onComplete: (data) {},
          ),
          SizedBox(
            height: 10.0,
          ),
          FaceBookButton(onComplete: (data, {errorMessage}) {
            if (data != null) {
            } else {
              scaffoldKey.currentState!
                  .showSnackBar(SnackBar(content: Text(errorMessage!)));
            }
          })
        ],
      ));

  Text buildText(BuildContext context) {
    return Text(
      "Hello",
      style: context.textTheme.subtitle1,
    );
  }
}
