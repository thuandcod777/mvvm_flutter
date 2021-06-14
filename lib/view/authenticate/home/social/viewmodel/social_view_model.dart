import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/model/base_view_model.dart';
import 'package:mvvm_flutter/view/_product/_model/query/friend_query.dart';
import 'package:mvvm_flutter/view/_product/_utilty/thorottle_helper.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/service/isocial_service.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/service/social_service.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  late ISocialService _socialService;

  @observable
  List<SocialUser> socialUserList = [];

  late ThorottleStringHelper _thorottleStringHelper;

  String _query = "";

  @observable
  bool isLoading = false;

  @observable
  bool isPageLoad = false;

  @observable
  bool isLoadDataPageFinish = false;

  @observable
  int page = 0;

  @override
  void init() {
    _socialService = SocialService(vexanaManager!.networkManager, scaffoldKey);
    _thorottleStringHelper = ThorottleStringHelper();
    fetchAllUser();
  }

  @action
  Future<void> fetchAllUser() async {
    _changeLoading();
    final response = await _socialService.fetchUserHouseList(FriendQuery());
    socialUserList = response!;
    _changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isPageLoad ||
        index != socialUserList.length - 1 ||
        isLoadDataPageFinish) return;
    _changeLoading();

    final response = await _socialService
        .fetchUserHouseList(FriendQuery(limit: page + 1, q: _query));
    if (response!.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }

      page++;
    } else {
      isLoadDataPageFinish = true;
    }

    _changeLoading();
  }

  void fetchAllSearchQuery(String text) {
    _thorottleStringHelper.onDelayTouch(text, (text) {
      if (_query.isEmpty) {
        page = -1;
      }
      _query = text;
      isLoadDataPageFinish = false;
      socialUserList = [];
      fetchAllUserLoading(0);
    });
  }

  @action
  void _changeLoading() {
    isLoading != isLoading;
  }

  @action
  void _changePageLoad() {
    isPageLoad = !isPageLoad;
  }
}
