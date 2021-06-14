import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';

class OpenContainerWrapper extends StatelessWidget {
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  const OpenContainerWrapper(
      {Key? key,
      this.closedBuilder,
      this.transitionType,
      this.onClosed,
      this.socialUser})
      : super(key: key);

  final OpenContainerBuilder? closedBuilder;
  final ContainerTransitionType? transitionType;
  final ClosedCallback<bool>? onClosed;
  final SocialUser? socialUser;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return Text("data");
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder:
          closedBuilder as Widget Function(BuildContext, void Function()),
    );
  }
}
