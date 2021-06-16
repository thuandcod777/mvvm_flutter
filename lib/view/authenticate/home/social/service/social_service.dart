import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/_product/_model/query/friend_query.dart';
import 'package:mvvm_flutter/view/_product/_model/query/friend_query_enum.dart';
import 'package:mvvm_flutter/view/_product/_utilty/service_helper.dart';
import 'package:mvvm_flutter/view/_product/enum/network_route_enum.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/service/isocial_service.dart';
import 'package:vexana/vexana.dart';

class SocialService extends ISocialService with ServiceHelper {
  SocialService(INetworkManager manager, GlobalKey<ScaffoldState>? scaffoldKey)
      : super(manager, scaffoldKey);

  @override
  Future<SocialUser?> fetchUser(id) async {
    final response = await manager.send<SocialUser, SocialUser>(
        NetworkRoutes.FRIEND.rawValue,
        parseModel: SocialUser(),
        urlSuffix: '/$id',
        method: RequestType.GET);
    showMessage(scaffoldKey, response.error);
    return response.data;
  }

  @override
  Future<List<SocialUser>> fetchUserHouseList(FriendQuery query) async {
    final response = await manager.send<SocialUser, List<SocialUser>>(
        NetworkRoutes.FRIEND.rawValue,
        parseModel: SocialUser(),
        queryParameters: {
          FriendQueryEnum.LIMIT.rawValue: query.limit,
          FriendQueryEnum.Q.rawValue: query.q
        },
        method: RequestType.GET);
    showMessage(scaffoldKey, response.error);
    return response.data ?? [];
  }

  @override
  Future<List<SocialUser>> fetchUserNameQuery(String text) {
    throw UnimplementedError();
  }
}
