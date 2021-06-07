import 'package:flutter_test/flutter_test.dart';

import 'onboard_mock_view_model.dart';

main() {
  late OnBoardMockViewModel mockViewModel;
  late IStringHelper stringHelper;
  setUp(() {
    mockViewModel = OnBoardMockViewModel();
    stringHelper = MockStringHelper();

    mockViewModel.init();
  });

  test("String helper upper case", () {
    String text = "Hello";
    text = stringHelper.toUpper(text);

    expect(text.trim().contains(RegExp("[A-Z\s]+")), true);
  });

  test("OnBoard Get Models", () async {
    await mockViewModel.onBoardGetModels();

    expect(mockViewModel.onBoardModel, isNotEmpty);
  });

  test("OnBoard Get Service", () async {
    expect(mockViewModel.isLoading, false);
    await mockViewModel.getServiceRequest();
    expect(mockViewModel.isLoading, false);
  });

  test("OnBoard On Page Changed", () {
    mockViewModel.onPageChanged(5);

    expect(5, mockViewModel.currentPageIndex);
  });

  group("Test All", () {
    int index = 00;
    test("onBoard Get Models", () async {
      await mockViewModel.onBoardGetModels();
      mockViewModel.currentPageIndex = mockViewModel.onBoardModel.length;
      expect(mockViewModel.onBoardModel, isNotEmpty);
    });

    test("onBoard On Page Changed", () {
      //expect(mockViewModel.onBoardModel.length, mockViewModel.currentPageIndex);
      mockViewModel.onPageChanged(index);
      expect(index, mockViewModel.currentPageIndex);
    });
  });
}
