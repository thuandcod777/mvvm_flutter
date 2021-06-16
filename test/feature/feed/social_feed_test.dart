import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_flutter/view/_product/_model/query/friend_query.dart';
import 'package:vexana/vexana.dart';

import 'feed_mockito.dart';
import 'social_network_mock.dart';

void main() {
  BuildContext? context;
  SocialNetworkMock? mockService;
  INetworkManager networkManager;
  late SocialMockViewModel socialMockViewModel;

  setUp(() {
    context = SocialBuildContext();
    networkManager = NetworkManager(options: BaseOptions());

    mockService = SocialNetworkMock(networkManager, null);
    socialMockViewModel = SocialMockViewModel(mockService!);
  });

  test('Context Test', () async {
    verify(socialMockViewModel.setContext(context));
  });

  test('Loading Page Test', () async {
    socialMockViewModel.fetchAllUserLoading(1);
    expect(socialMockViewModel.isPageLoading, true);
    // socialMockViewModel!.isLoading = true;
    await Future.delayed(Duration(seconds: 1));
    expect(socialMockViewModel.isPageLoading, false);

    //verifyNever(socialMockViewModel!.isLoading);
    //socialMockViewModel!.isPageLoad = false;
    // verify(socialMockViewModel!.isLoading).called(2);
  });

  test('User All Loading', () async {
    socialMockViewModel.isPageLoading = false;
    socialMockViewModel.socialUserList = [];
    socialMockViewModel.isLoadDataPageFinish = false;

    await socialMockViewModel.fetchAllUserLoading(-1);
    expect(socialMockViewModel.socialUserList.isNotEmpty, true);
    expect(socialMockViewModel.page > 0, true);

    // socialMockViewModel!.isLoading = true;
    //await Future.delayed(Duration(seconds: 1));
    expect(socialMockViewModel.isPageLoading, false);

    //verifyNever(socialMockViewModel!.isLoading);
    //socialMockViewModel!.isPageLoad = false;
    // verify(socialMockViewModel!.isLoading).called(2);
  });

  test('List check', () async {
    socialMockViewModel.setContext(context);
    await socialMockViewModel.fetchAllUserLoading(1);
    //when(socialMockViewModel!.fetchAllUserLoading(0)).thenReturn(Future.value(''));

    expect(socialMockViewModel.socialUserList.length, 1);
  });
  
  test('Loading Test', () async {
    await socialMockViewModel.fetchAllUserLoading(1);
    verifyNever(socialMockViewModel.isPageLoading);
  });

  test('Fetch user id', () async {
    final response = await mockService!.fetchUser(10);
    expect(response, isNotNull);
  });

  test('Fetch house id', () async {
    final response = await mockService!.fetchUserHouseList(FriendQuery());
    expect(response, isNotEmpty);
  });

  test('Fetch Query UserName', () async {
    final response = await mockService!.fetchUserNameQuery('Hello');
    expect(response, isNotEmpty);
  });
}
