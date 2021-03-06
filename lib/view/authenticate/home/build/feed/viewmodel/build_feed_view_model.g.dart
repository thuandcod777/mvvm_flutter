// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_feed_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuildFeedViewModel on _BuildFeedViewModelBase, Store {
  Computed<HouseModel>? _$sliderHouseComputed;

  @override
  HouseModel get sliderHouse =>
      (_$sliderHouseComputed ??= Computed<HouseModel>(() => super.sliderHouse,
              name: '_BuildFeedViewModelBase.sliderHouse'))
          .value;

  final _$isLoadingAtom = Atom(name: '_BuildFeedViewModelBase.isLoading');

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

  final _$houseModelAtom = Atom(name: '_BuildFeedViewModelBase.houseModel');

  @override
  List<HouseModel>? get houseModel {
    _$houseModelAtom.reportRead();
    return super.houseModel;
  }

  @override
  set houseModel(List<HouseModel>? value) {
    _$houseModelAtom.reportWrite(value, super.houseModel, () {
      super.houseModel = value;
    });
  }

  final _$getListAllAsyncAction =
      AsyncAction('_BuildFeedViewModelBase.getListAll');

  @override
  Future<void> getListAll() {
    return _$getListAllAsyncAction.run(() => super.getListAll());
  }

  final _$_BuildFeedViewModelBaseActionController =
      ActionController(name: '_BuildFeedViewModelBase');

  @override
  void onLikeItemPressed(String id) {
    final _$actionInfo = _$_BuildFeedViewModelBaseActionController.startAction(
        name: '_BuildFeedViewModelBase.onLikeItemPressed');
    try {
      return super.onLikeItemPressed(id);
    } finally {
      _$_BuildFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeLoading() {
    final _$actionInfo = _$_BuildFeedViewModelBaseActionController.startAction(
        name: '_BuildFeedViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_BuildFeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
houseModel: ${houseModel},
sliderHouse: ${sliderHouse}
    ''';
  }
}
