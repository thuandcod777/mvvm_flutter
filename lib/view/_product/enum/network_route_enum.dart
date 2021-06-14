enum NetworkRoutes { LOGIN, BUILD_HOME, FRIEND }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "login";
      case NetworkRoutes.BUILD_HOME:
        return "house";
      case NetworkRoutes.FRIEND:
        return "friend";
      default:
        throw Exception("Routes Not Found");
    }
  }
}
