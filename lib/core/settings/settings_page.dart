import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/l10n/l10n.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';
import 'package:src/commons/provider/locale_provider.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  static String iconDown = "assets/svg/icon/down_arrow.svg";

  static String iconUp = "assets/svg/icon/up_arrow.svg";

  List<String> get language => [
        "English",
        "Tiếng Việt",
      ];
  List<String> get settingName => [
        S.current.setting_language,
        S.current.setting_sound,
        S.current.setting_light_dark_theme,
        S.current.setting_other,
      ];
  List<String> get miscSettingName => [
        S.current.setting_achievement,
        S.current.setting_notification,
        S.current.setting_remember_user,
      ];

  String get title => S.current.setting_title;

  int get locale => L10n.all.indexOf(provider.locale);
  set locale(int value) {
    provider.setLocale(L10n.all[value]);
  }

  LocaleProvider get provider =>
      Provider.of<LocaleProvider>(context, listen: false);

  double sound = 0.5; // TODO: put in Preference.

  bool get darkMode => CovidDiaryPreferences.getValue<bool>("isDarkTheme");
  set darkMode(bool value) => setState(() {
        CovidDiaryPreferences.setValue("isDarkTheme", value);

        if (value)
          Provider.of<ThemeManager>(context, listen: false).themeData =
              ThemeManager.darkTheme;
        else
          Provider.of<ThemeManager>(context, listen: false).themeData =
              ThemeManager.lightTheme;
      });

  bool get achievementOn =>
      CovidDiaryPreferences.getValue<bool>("achievementOn");
  set achievementOn(bool value) => setState(() {
        CovidDiaryPreferences.setValue("achievementOn", value);
      });

  bool get notificationOn =>
      CovidDiaryPreferences.getValue<bool>("notificationOn");
  set notificationOn(bool value) => setState(() {
        CovidDiaryPreferences.setValue("notificationOn", value);
      });

  bool get rememberUserOn =>
      CovidDiaryPreferences.getValue<bool>("rememberUserOn");
  set rememberUserOn(bool value) => setState(() {
        CovidDiaryPreferences.setValue("rememberUserOn", value);
      });

  ExpandableController _controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBarCustom(context: context, title: title), //app bar
      body: Column(
        children: [
          languageSetting(),
          soundSetting(),
          darkLightThemeSetting(),
          otherSetting(),
        ],
      ),
    );
  }

  Widget languageSetting() {
    return Container(
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: getCustomColor().panelDark,
        //borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              settingName[0],
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(16.r),
          ),
          Spacer(),
          Container(
            child: DropdownButton(
              value: language[locale],
              icon: downIcon(),
              onChanged: (String? newValue) =>
                  locale = language.indexOf(newValue!),
              dropdownColor: getCustomColor().panelLight,
              items: language.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            padding: EdgeInsets.only(right: 16.r),
          ),
        ],
      ),
    );
  }

  Widget soundSetting() {
    return Container(
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: getCustomColor().panelDark,
        //borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              settingName[1],
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(16.r),
          ),
          Spacer(),
          Slider(
            onChanged: (value) => setState(() {
              sound = value;
            }),
            value: sound,
            /*
            thumbColor: getCustomColor().primary,
            activeColor: getCustomColor().white,
            inactiveColor: getCustomColor().gray,
            // */
          ),
        ],
      ),
    );
  }

  Widget darkLightThemeSetting() {
    return Container(
      margin: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: getCustomColor().panelDark,
        //borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              settingName[2],
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(16.r),
          ),
          Spacer(),
          Switch(
            value: darkMode,
            onChanged: (value) => darkMode = value,
          ),
        ],
      ),
    );
  }

  Widget otherSetting() {
    return ExpandablePanel(
      collapsed: Container(child: otherSettingHeader()),
      expanded: Column(
        children: [
          otherSettingHeader(),
          miscSetting(0),
          miscSetting(1),
          miscSetting(2),
        ],
      ),
      controller: _controller,
    );
  }

  Widget otherSettingHeader() {
    return Container(
      margin: EdgeInsets.fromLTRB(16.r, 16.r, 16.r, 0),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: getCustomColor().panelDark,
        //borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              settingName[3],
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Spacer(),
          GestureDetector(
              child: _controller.expanded ? upIcon() : downIcon(),
              onTap: () => setState(() {
                    _controller.toggle();
                  })),
        ],
      ),
    );
  }

  Widget miscSetting(int id) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.r, 0, 16.r, 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: getCustomColor().white,
        //borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            child: Text(
              miscSettingName[id],
              style: Theme.of(context).textTheme.bodyText2,
            ),
            padding: EdgeInsets.all(16.r),
          ),
          Spacer(),
          Switch(
            value: getMiscSetting(id),
            onChanged: (value) => setMiscSetting(id, value),
          ),
        ],
      ),
    );
  }

  bool getMiscSetting(int id) {
    switch (id) {
      case 0:
        return achievementOn;
      case 1:
        return notificationOn;
      case 2:
        return rememberUserOn;
      default:
        return false;
    }
  }

  void setMiscSetting(int id, bool value) {
    switch (id) {
      case 0:
        achievementOn = value;
        return;
      case 1:
        notificationOn = value;
        return;
      case 2:
        rememberUserOn = value;
        return;
      default:
        return;
    }
  }

  Widget downIcon() {
    return SvgPicture.asset(
      iconDown,
      width: 32.r,
      height: 32.r,
      fit: BoxFit.fill,
    );
  }

  Widget upIcon() {
    return SvgPicture.asset(
      iconUp,
      width: 32.r,
      height: 32.r,
      fit: BoxFit.fill,
    );
  }
}
