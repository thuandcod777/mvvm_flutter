import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_flutter/core/extension/string_extension.dart';

main() {
  setUp(() {});
  test("Email Regex", () {
    String email = "joedoe@gmail.com";
    expect(email.isValidEmail, null);
  });
}
