import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/model/house_model.dart';
import 'package:vexana/vexana.dart';

abstract class IBuildFeedService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IBuildFeedService(this.manager, this.scaffoldyKey);

  Future<List<HouseModel>?> fetchUserHouseList();
}
