import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('vi'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      case 'vi':
        return '🇮🇳';
      default:
        return '🇺🇸';
    }
  }
}
