import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/HealthDiary/health_report.dart';
import 'package:src/core/HealthDiary/health_history.dart';
import 'package:src/core/dashboard/widget/animated_panel_header_widget.dart';
import 'package:src/core/dashboard/widget/panel_header_widget.dart';
import 'package:src/core/health_decleration/health_declaration.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/panel.dart';

class DBHealthTrackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PanelLight(
      child: Column(children: [
        DBAnimatedPanelHeader(
          title: S.current.dashboard_heath_track,
          openWidget: HealthHistory(),
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicHeight(
                child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dayHealth(context, 6, DBEmoticon.SAD),
                _divider(),
                _dayHealth(context, 0, DBEmoticon.GOOD),
                _dayHealth(context, 1, DBEmoticon.SAD),
                _dayHealth(context, 2, DBEmoticon.GOOD),
                _dayHealth(context, 3, DBEmoticon.SAD),
                _dayHealth(context, 4, DBEmoticon.GOOD),
                _dayHealth(context, 5, DBEmoticon.SAD),
                _dayHealth(context, 6, DBEmoticon.GOOD),
                _divider(),
                _dayHealth(context, 0, DBEmoticon.NONE, true),
                _dayHealth(context, 1, DBEmoticon.NONE),
                _dayHealth(context, 2, DBEmoticon.NONE),
                _dayHealth(context, 3, DBEmoticon.NONE),
                _dayHealth(context, 4, DBEmoticon.NONE),
                _dayHealth(context, 5, DBEmoticon.NONE),
              ],
            ))),
        SizedBox(height: 8.h),
        BorderButton(
          isAccent: true,
          onPressed: () => {navigateTo(EmotionReport(), context)},
          buttonText: S.current.dashboard_heath_track_button,
        ),
      ]),
    );
  }

  Widget _divider() {
    return VerticalDivider(thickness: 2.w, color: getCustomColor().black);
  }

  Widget _dayHealth(BuildContext context, int dayInWeek, DBEmoticon? emoticon,
      [bool isToday = false]) {
    return Column(
      children: [
        _dayTag(context, dayInWeek, isToday),
        SizedBox(height: 4.h),
        _getEmoticon(emoticon!),
      ],
    );
  }

  Widget _dayTag(BuildContext context, int dayInWeek, bool isToday) {
    return Container(
        width: 24,
        height: 24,
        child: Center(
            child: Text(
          _getDayInWeek(dayInWeek),
          style: Theme.of(context).textTheme.headline6!.copyWith(
              color: isToday
                  ? getCustomColor().background
                  : getCustomColor().black),
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(64.r),
            ),
            color: (isToday
                ? getCustomColor().secondary
                : getCustomColor().background)));
  }

  Widget _getEmoticon(DBEmoticon emoticon) {
    String path = _getEmoticonPath(emoticon);
    return Image.asset(path, width: 48.w, height: 48.h);
  }

  DBEmoticon _getRandomEmoPath() {
    int randIndex = 0;
    while (DBEmoticon.values[randIndex] == DBEmoticon.NONE) {
      randIndex = Random().nextInt(DBEmoticon.values.length);
    }
    return DBEmoticon.values[randIndex];
  }

  String _getEmoticonPath(DBEmoticon emoticon) {
    switch (emoticon) {
      case DBEmoticon.DIZZY:
        return "assets/svg/emo_dizzy.png";
      case DBEmoticon.GOOD:
        return "assets/svg/emo_good.png";
      case DBEmoticon.HAPPY:
        return "assets/svg/emo_happy.png";
      case DBEmoticon.SAD:
        return "assets/svg/emo_sad.png";
      case DBEmoticon.SICK:
        return "assets/svg/emo_sick.png";
      case DBEmoticon.TIRED:
        return "assets/svg/emo_tired.png";
      default:
        return "assets/svg/emo_none.png";
    }
  }

  String _getDayInWeek(int dayInWeek) {
    var displayString = [
      S.current.dashboard_monday,
      S.current.dashboard_tuesday,
      S.current.dashboard_wednesday,
      S.current.dashboard_thursday,
      S.current.dashboard_friday,
      S.current.dashboard_saturday,
      S.current.dashboard_sunday
    ];
    return displayString[dayInWeek];
  }
}

enum DBEmoticon { NONE, DIZZY, GOOD, HAPPY, SAD, SICK, TIRED }
