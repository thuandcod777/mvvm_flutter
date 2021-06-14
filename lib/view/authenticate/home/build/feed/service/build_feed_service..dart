import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/_product/_utilty/service_helper.dart';
import 'package:mvvm_flutter/view/_product/enum/network_route_enum.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/model/house_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/service/ibuild_feed_service.dart';
import 'package:vexana/vexana.dart';

class BuildFeedService extends IBuildFeedService with ServiceHelper {
  BuildFeedService(INetworkManager manager, GlobalKey<ScaffoldState> key)
      : super(manager, key);

  @override
  Future<List<HouseModel>?> fetchUserHouseList() async {
    final response = await manager.send<HouseModel, List<HouseModel>>(
        NetworkRoutes.BUILD_HOME.rawValue,
        parseModel: HouseModel(),
        method: RequestType.GET);

    showMessage(scaffoldyKey, response.error);

    return response.data;
  }
}
