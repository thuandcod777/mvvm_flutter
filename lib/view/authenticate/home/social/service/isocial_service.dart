import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/_product/_model/query/friend_query.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:vexana/vexana.dart';

abstract class ISocialService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  ISocialService(this.manager, this.scaffoldKey);

  Future<List<SocialUser>?> fetchUserHouseList(FriendQuery query);
  Future<List<SocialUser>> fetchUserNameQuery(String text);

  Future<SocialUser?> fetchUser(id);
}
