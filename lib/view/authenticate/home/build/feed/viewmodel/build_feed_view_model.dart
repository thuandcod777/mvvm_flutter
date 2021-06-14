import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/model/base_view_model.dart';
import 'package:mvvm_flutter/view/_product/_utilty/decoration_helper.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/model/house_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/service/build_feed_service..dart';
import 'package:mvvm_flutter/view/authenticate/home/build/feed/service/ibuild_feed_service.dart';
part 'build_feed_view_model.g.dart';

class BuildFeedViewModel = _BuildFeedViewModelBase with _$BuildFeedViewModel;

abstract class _BuildFeedViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  late DecorationHelper helper;
  late IBuildFeedService feedService;

  @observable
  bool isLoading = false;

  @observable
  List<HouseModel>? houseModel = [];

  List<String> listItem = [];

  @action
  void onLikeItemPressed(String id) {
    listItem.add(id);
    listItem = listItem;
  }

  @computed
  HouseModel get sliderHouse => houseModel!.first;

  @override
  void init() {
    helper = DecorationHelper(context: context);

    feedService = BuildFeedService(vexanaManager!.networkManager, scaffoldKey);
  }

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> getListAll() async {
    _changeLoading();
    houseModel = await feedService.fetchUserHouseList();

    _changeLoading();
  }
}
