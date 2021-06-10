import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mvvm_flutter/core/base/widget/base_widget.dart';
import 'package:mvvm_flutter/core/constants/image/image_constants.dart';
import 'package:mvvm_flutter/core/init/lang/locale_keys.g.dart';
import 'package:mvvm_flutter/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:mvvm_flutter/core/extension/context_extension.dart';
import 'package:mvvm_flutter/core/extension/string_extension.dart';
import 'package:easy_localization/easy_localization.dart';

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
            DefaultTabController(
              length: 2,
              child: Scaffold(
                key: value.scaffoldState,
                body: SafeArea(
                  child: Column(
                    children: [
                      buildAnimatedContainer(context),
                      buildContainerTab(),
                      Expanded(
                        flex: 6,
                        child: buildForm(value, context),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  AnimatedContainer buildAnimatedContainer(BuildContext context) {
    return AnimatedContainer(
        height:
            context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.2,
        color: Colors.white,
        duration: context.lowDuration,
        child: Center(child: Image.asset(ImageConstants.instance.logo)));
  }

  Container buildContainerTab() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
        child: buildTabBar(),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      indicatorColor: Colors.red,
      labelColor: Colors.red,
      tabs: [
        Tab(
          text: LocaleKeys.login_tab1.locale,
        ),
        Tab(
          text: LocaleKeys.login_tab2.locale,
        )
      ],
    );
  }

  Form buildForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formState,
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          buildTextFormFieldEmail(context, value),
          buildTextFormFieldPassword(context, value),
          buildTextForgotPassword(),
          Spacer(
            flex: 2,
          ),
          buildRaisedButtonLogin(context, value),
          buildWrap(),
          Spacer()
        ],
      ),
    );
  }

  Widget buildTextFormFieldPassword(
      BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return TextFormField(
        controller: viewModel.passwordController,
        validator: (value) => value!.isNotEmpty ? null : "This field required",
        obscureText: viewModel.isLockOpen,
        decoration: InputDecoration(
            labelText: LocaleKeys.login_password.locale,
            labelStyle: TextStyle(color: context.colors.onBackground),
            icon: Icon(
              Icons.lock_rounded,
              color: context.colors.onBackground,
            ),
            suffixIcon: FlatButton(onPressed: () {
              viewModel.isLockStateChange();
            }, child: Observer(builder: (_) {
              return Icon(
                  viewModel.isLockOpen ? Icons.lock_outline : Icons.lock_open);
            }))),
      );
    });
  }

  TextFormField buildTextFormFieldEmail(
      BuildContext context, LoginViewModel viewModel) {
    return TextFormField(
      controller: viewModel.emailController,
      validator: (value) =>
          value!.isValidEmails ? "Email does not valid" : null,
      decoration: InputDecoration(
        labelText: LocaleKeys.login_email.tr(),
        labelStyle: context.textTheme.subtitle1,
        icon: Icon(
          Icons.email,
          color: context.colors.onBackground,
        ),
      ),
    );
  }

  Widget buildTextForgotPassword() => Align(
      alignment: Alignment.centerRight,
      child: Text(
        LocaleKeys.login_forgotText.tr(),
        textAlign: TextAlign.end,
      ));

  Widget buildRaisedButtonLogin(
      BuildContext context, LoginViewModel viewModel) {
    return Observer(builder: (_) {
      return RaisedButton(
        padding: context.paddingNormal,
        shape: StadiumBorder(),
        onPressed: viewModel.isLoading
            ? null
            : () {
                viewModel.fetchLoginService();
              },
        child: Padding(
          padding: const EdgeInsets.only(left: 170.0, right: 170.0),
          child: Text(LocaleKeys.login_login.tr()),
        ),
        color: context.colors.onError,
      );
    });
  }

  Wrap buildWrap() {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Text(LocaleKeys.login_dontAccount.tr()),
        FlatButton(onPressed: () {}, child: Text("Sign Up"))
      ],
    );
  }
}
