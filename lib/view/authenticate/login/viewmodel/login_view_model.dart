import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/model/base_view_model.dart';
import 'package:mvvm_flutter/core/constants/enums/locale_keys_enum.dart';
import 'package:mvvm_flutter/core/init/network/vexana_manager.dart';
import 'package:mvvm_flutter/view/authenticate/login/model/login_model.dart';
import 'package:mvvm_flutter/view/authenticate/login/service/ilogin_service.dart';
import 'package:mvvm_flutter/view/authenticate/login/service/login_service.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();

  late ILoginService loginService;

  TextEditingController? emailController;
  TextEditingController? passwordController;

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool isLoading = false;

  @observable
  bool isLockOpen = false;

  Future<void> fetchLoginService() async {
    isLoadingChange();
    if (formState.currentState!.validate()) {
      final response = await loginService.fetchUserControl(LoginModel(
          email: emailController!.text, password: passwordController!.text));

      if (response != null) {
        if (scaffoldState.currentState != null) {
          scaffoldState.currentState!
              .showSnackBar(SnackBar(content: Text(response.token!)));
        }

        await localeManager.setStringValue(
            PreferencesKeys.TOKEN, response.token!);
      }
    }
    isLoadingChange();
  }

  void isLoadingChange() {
    isLoading = !isLoading;
  }

  void isLockStateChange() {
    isLockOpen = !isLockOpen;
  }
}
