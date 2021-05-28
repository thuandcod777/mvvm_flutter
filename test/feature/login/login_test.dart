import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {
    print("Here");
  });

  test("User Login Fail Test", () {
    final isUserLogin = true;

    expect(isUserLogin, isTrue);
  });
}
