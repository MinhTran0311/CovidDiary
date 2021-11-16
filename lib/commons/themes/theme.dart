import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';
import 'package:src/commons/themes/dark_color.dart';

import 'custom_colors.dart';
import 'light_color.dart';

/// Theme manager
class ThemeManager extends ChangeNotifier {
  ThemeManager(ThemeData? initialTheme)
      : _themeData = initialTheme ?? lightTheme;

  ThemeData _themeData;

  /// Returns the current theme
  ThemeData get themeData => _themeData;

  /// Sets the current theme
  set themeData(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }

  /// Light mode theme
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: getTextTheme(ThemeData.light()
        .textTheme
        .apply(displayColor: lightColor.black, bodyColor: lightColor.black)),
    scaffoldBackgroundColor: lightColor.background,
    backgroundColor: lightColor.background,
    hintColor: lightColor.gray,
    canvasColor: Colors.transparent,
  );

  static ThemeData darkTheme = ThemeData.light().copyWith(
    textTheme: getTextTheme(ThemeData.light()
        .textTheme
        .apply(displayColor: darkColor.black, bodyColor: darkColor.black)),
    scaffoldBackgroundColor: darkColor.background,
    backgroundColor: darkColor.background,
    hintColor: darkColor.gray,
    canvasColor: Colors.transparent,
  );
}

CustomColors getCustomColor() {
  return !CovidDiaryPreferences.getValue<bool>("isDarkTheme")
      ? lightColor
      : darkColor;
}

getTextTheme(TextTheme textTheme) {
  return TextTheme(
    headline1: textTheme.headline1?.copyWith(
        fontSize: 60.sp, height: (70 / 60).sp, fontWeight: FontWeight.w700),
    headline2: textTheme.headline2?.copyWith(
        fontSize: 48.sp, height: (56 / 48).sp, fontWeight: FontWeight.w300),
    headline3:
        textTheme.headline3?.copyWith(fontSize: 36.sp, height: (44 / 36).sp),

    ///Title
    headline4: textTheme.headline4?.copyWith(
        fontFamily: 'Roboto Condensed',
        fontSize: 32.sp,
        height: (38 / 32).sp,
        fontWeight: FontWeight.w700),

    ///Heading 1
    headline5: textTheme.headline5?.copyWith(
        fontFamily: 'Roboto Condensed',
        fontSize: 24.sp,
        height: (32 / 24).sp,
        fontWeight: FontWeight.w700),

    ///Heading 2
    headline6: textTheme.headline6?.copyWith(
        fontFamily: 'Roboto Condensed',
        fontSize: 20.sp,
        height: (32 / 20).sp,
        fontWeight: FontWeight.w700),

    ///Normal Text
    bodyText1: textTheme.bodyText1?.copyWith(
        fontSize: 16.sp, height: (20 / 16).sp, fontWeight: FontWeight.w400),

    ///Rich Text
    bodyText2: textTheme.bodyText2?.copyWith(
        fontSize: 14.sp, height: (20 / 12).sp, fontWeight: FontWeight.w400),

    ///subtitle
    subtitle1: textTheme.subtitle1?.copyWith(
        fontSize: 16.sp, height: (20 / 16).sp, fontWeight: FontWeight.w300),
    subtitle2:
        textTheme.subtitle2?.copyWith(fontSize: 14.sp, height: (20 / 14).sp),

    ///Button text
    button: textTheme.button?.copyWith(
        fontSize: 16.sp, height: (20 / 16).sp, fontWeight: FontWeight.w700),

    ///Input Caption
    caption: textTheme.caption?.copyWith(
        fontFamily: 'Roboto Condensed', fontSize: 14.sp, height: (16 / 14).sp),
  );
}
