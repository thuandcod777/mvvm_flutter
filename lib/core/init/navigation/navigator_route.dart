import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/components/card/not_found_navigation_widget.dart';
import 'package:mvvm_flutter/core/constants/navigation/navigator_constants.dart';
import 'package:mvvm_flutter/view/authenticate/test/view/test_view.dart';

class NavigatorRoute {
  static NavigatorRoute _instance = NavigatorRoute._init();
  static NavigatorRoute get instance => _instance;
  NavigatorRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigatorConstants.TEST_VIEW:
        return normalNavgator(TestView());
      default:
        return MaterialPageRoute(
            builder: (context) => NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavgator(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
