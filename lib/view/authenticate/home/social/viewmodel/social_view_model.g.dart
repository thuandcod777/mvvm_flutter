// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SocialViewModel on _SocialViewModelBase, Store {
  final _$isLoadDataPageFinishAtom =
      Atom(name: '_SocialViewModelBase.isLoadDataPageFinish');

  @override
  bool get isLoadDataPageFinish {
    _$isLoadDataPageFinishAtom.reportRead();
    return super.isLoadDataPageFinish;
  }

  @override
  set isLoadDataPageFinish(bool value) {
    _$isLoadDataPageFinishAtom.reportWrite(value, super.isLoadDataPageFinish,
        () {
      super.isLoadDataPageFinish = value;
    });
  }

  final _$socialUserListAtom =
      Atom(name: '_SocialViewModelBase.socialUserList');

  @override
  List<SocialUser> get socialUserList {
    _$socialUserListAtom.reportRead();
    return super.socialUserList;
  }

  @override
  set socialUserList(List<SocialUser> value) {
    _$socialUserListAtom.reportWrite(value, super.socialUserList, () {
      super.socialUserList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SocialViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isPageLoadingAtom = Atom(name: '_SocialViewModelBase.isPageLoading');

  @override
  bool get isPageLoading {
    _$isPageLoadingAtom.reportRead();
    return super.isPageLoading;
  }

  @override
  set isPageLoading(bool value) {
    _$isPageLoadingAtom.reportWrite(value, super.isPageLoading, () {
      super.isPageLoading = value;
    });
  }

  final _$fetchAllUserAsyncAction =
      AsyncAction('_SocialViewModelBase.fetchAllUser');

  @override
  Future<void> fetchAllUser() {
    return _$fetchAllUserAsyncAction.run(() => super.fetchAllUser());
  }

  final _$fetchAllUserLoadingAsyncAction =
      AsyncAction('_SocialViewModelBase.fetchAllUserLoading');

  @override
  Future<void> fetchAllUserLoading(int index) {
    return _$fetchAllUserLoadingAsyncAction
        .run(() => super.fetchAllUserLoading(index));
  }

  final _$_SocialViewModelBaseActionController =
      ActionController(name: '_SocialViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLoadingLazyLoad() {
    final _$actionInfo = _$_SocialViewModelBaseActionController.startAction(
        name: '_SocialViewModelBase.changeLoadingLazyLoad');
    try {
      return super.changeLoadingLazyLoad();
    } finally {
      _$_SocialViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadDataPageFinish: ${isLoadDataPageFinish},
socialUserList: ${socialUserList},
isLoading: ${isLoading},
isPageLoading: ${isPageLoading}
    ''';
  }
}
