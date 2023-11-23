import 'package:my_books_to_read/core/app/constants.dart';
import 'package:my_books_to_read/generated/l10n.dart';

abstract class EmailValidator {
  static bool validate(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    if (!RegExp(RegExpPreset.email).hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? validateWithMessage(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.thisFieldIsNecessary;
    }
    if (!RegExp(RegExpPreset.email).hasMatch(value)) {
      return S.current.invalidEmail;
    }
    return null;
  }
}

abstract class PasswordValidator {
  static bool validate(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return true;
  }

  static String? validateWithMessage(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.thisFieldIsNecessary;
    }
    return null;
  }
}
