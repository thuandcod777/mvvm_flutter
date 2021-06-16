import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mvvm_flutter/core/base/model/base_view_model.dart';
import 'package:mvvm_flutter/view/_product/_model/query/friend_query.dart';
import 'package:mvvm_flutter/view/_product/_utilty/thorottle_helper.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/model/social_user_model.dart';
import 'package:mvvm_flutter/view/authenticate/home/social/service/isocial_service.dart';

part 'social_view_model.g.dart';

class SocialViewModel = _SocialViewModelBase with _$SocialViewModel;

abstract class _SocialViewModelBase with Store, BaseViewModel {
  _SocialViewModelBase(this._socialService);

  @override
  void setContext(BuildContext? context) => this.context = context;
  //GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  final ISocialService _socialService;

  String? _query = "";

  int _page = 0;

  int get page => _page;

  @observable
  bool isLoadDataPageFinish = false;

  @observable
  List<SocialUser> socialUserList = [];

  late ThorottleStringHelper _thorottleStringHelper;

  @observable
  bool isLoading = false;

  @observable
  bool isPageLoading = false;

  @override
  void init() {
    //_socialService = SocialService(vexanaManager!.networkManager, scaffoldKey);
    _thorottleStringHelper = ThorottleStringHelper();
    fetchAllUser();
  }

  @action
  Future<void> fetchAllUser() async {
    changeLoading();
    final response = await _socialService.fetchUserHouseList(FriendQuery());
    socialUserList = response;
    changeLoading();
  }

  @action
  Future<void> fetchAllUserLoading(int index) async {
    if (isPageLoading ||
        index != socialUserList.length - 1 ||
        isLoadDataPageFinish) return;
    changeLoading();

    final response = await _socialService
        .fetchUserHouseList(FriendQuery(limit: page + 1, q: _query));
    if (response.isNotEmpty) {
      if (socialUserList.isEmpty) {
        socialUserList = response;
      } else if (response.last != socialUserList.last) {
        socialUserList.addAll(response);
        socialUserList = socialUserList;
      }

      _page++;
    } else {
      isLoadDataPageFinish = true;
    }

    changeLoading();
  }

  @action
  void fetchAllSearchQuery(String text) {
    _thorottleStringHelper.onDelayTouch(text, (text) {
      if (_query!.isEmpty) {
        _page = -1;
      }
      _query = text;
      isLoadDataPageFinish = false;
      socialUserList = [];
      fetchAllUserLoading(socialUserList.length - 1);
    });
  }

  @action
  void changeLoading() {
    isLoading != isLoading;
  }

  @action
  void changeLoadingLazyLoad() {
    isPageLoading = !isPageLoading;
  }
}
