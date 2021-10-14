import 'package:flutter/material.dart';
import 'package:src/commons/l10n/generated/l10n.dart';

// https://github.com/aarajput/flutter_form_validators
class Validators {
  static FormFieldValidator<String> required({String? errorMessage}) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.trim().isEmpty)
        return errorMessage ?? S.current.text_field_error_empty_input;
      else
        return null;
    };
  }

  static FormFieldValidator<String> min(double min, String errorMessage) {
    return (value) {
      if (value == null) value = '';

      if (value.trim().isEmpty) return null;

      if (value.length < min) return errorMessage;

      return null;
    };
  }

  static FormFieldValidator<String> max(double max, String errorMessage) {
    return (value) {
      if (value == null) value = '';

      if (value.trim().isEmpty) return null;

      if (value.length > max) return errorMessage;
      return null;
    };
  }

  static FormFieldValidator<String> email() {
    return patternString(
        "[a-z0-9!#\$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#\$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
        S.current.text_field_error_invalid_email);
  }

  static FormFieldValidator<String> phoneNumber() {
    return (value) {
      value = value?.replaceAll(' ', '');

      return patternString('(([\+84|84|0])?(3|5|7|8|9|1[2|6|8|9]))+([0-9]{8})',
          S.current.text_field_error_invalid_phone_number)(value);
    };
  }

  static FormFieldValidator<String> minLength(
      int minLength, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.trim().isEmpty) return null;

      if (value.length < minLength)
        return errorMessage;
      else
        return null;
    };
  }

  static FormFieldValidator<String> maxLength(
      int maxLength, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.trim().isEmpty) return null;

      if (value.length > maxLength)
        return errorMessage;
      else
        return null;
    };
  }

  static FormFieldValidator<String> patternString(
      String pattern, String errorMessage) {
    return patternRegExp(RegExp(pattern), errorMessage);
  }

  static FormFieldValidator<String> patternRegExp(
      RegExp pattern, String errorMessage) {
    return (value) {
      if (value == null) {
        value = '';
      }
      if (value.trim().isEmpty) return null;

      if (pattern.hasMatch(value))
        return null;
      else
        return errorMessage;
    };
  }

  static FormFieldValidator<String> compareWith(String src, String fieldName) {
    return (value) {
      if (value != src) {
        return fieldName + ' ' + 'not_match';
      }
      return null;
    };
  }

  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
