import 'package:easy_localization/easy_localization.dart';
import 'package:mvvm_flutter/core/constants/app/app_constans.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      this.contains(RegExp(ApplicationConstants.EMAIL_REGEX))
          ? null
          : "Email does not valid";
}
