import 'package:mvvm_flutter/view/_product/enum/network_route_enum.dart';
import 'package:mvvm_flutter/view/authenticate/login/model/login_model.dart';
import 'package:mvvm_flutter/view/authenticate/login/model/login_response_model.dart';
import 'package:mvvm_flutter/view/authenticate/login/service/ilogin_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

class LoginService extends ILoginService {
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
        NetworkRoutes.LOGIN.rawValue,
        parseModel: LoginResponseModel(),
        method: RequestType.POST,
        data: model);

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
