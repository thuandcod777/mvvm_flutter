import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/init/network/vexana_manager.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/service/isocial_service.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/service/social_service.dart';
import 'package:vexana/vexana.dart';
import 'package:kartal/kartal.dart';

class SocialUserViewDetail extends StatelessWidget {
  final SocialUser? socialUser;

  final INetworkManager manager = VexanaManager.instance.networkManager;

  ISocialService get socialService => SocialService(manager, null);

  SocialUserViewDetail({Key? key, this.socialUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: socialService.fetchUser(socialUser!.id).toBuild<SocialUser>(
          onSuccess: (data) {
            return Center(child: Image.network(data.image!));
          },
          loadingWidget: CircularProgressIndicator(),
          notFoundWidget: Center(
            child: Text('Not Found'),
          ),
          onError: Text('errro')),
    );
  }
}
