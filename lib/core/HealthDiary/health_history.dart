import 'dart:ui';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/HealthDiary/symptom_detail.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/gradientSliderShape.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

import 'health_report.dart';

class HealthHistory extends StatelessWidget {
  const HealthHistory({Key? key}) : super(key: key);

  static String title = S.current.health_history_title;

  static List<int> emotions = [0, 3, 1, 6, 3, 4, 1];
  static List<double> defaultSymptoms = [0, 0, 0, 0, 0, 0, 0, 0];
  static List<double> symptoms1 = [0.5, 0, 0, 0, 0, 1.3, 0, 0];
  static List<double> symptoms2 = [0.5, 3, 0, 0.3, 0, 0, 0, 0];
  static List<List<double>> symptoms = [
    defaultSymptoms,
    symptoms1,
    defaultSymptoms,
    defaultSymptoms,
    defaultSymptoms,
    symptoms2,
    defaultSymptoms,
  ];

  static DateTime start = DateTime.now();
  static List<DateTime> days = [
    start,
    start.add(Duration(days: 1)),
    start.add(Duration(days: 2)),
    start.add(Duration(days: 3)),
    start.add(Duration(days: 4)),
    start.add(Duration(days: 5)),
    start.add(Duration(days: 6)),
  ];
  static int itemCount = emotions.length;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < itemCount; i++)
      items.add(HealthHistoryItem(
        date: days[i],
        emotion: emotions[i],
        symptomSeverity: symptoms[i],
      ));

    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(context: context, title: title), //app bar
        body: ListView(
          children: items,
        ), //các widget khác
      ),
    );
  }
}

class HealthHistoryItem extends StatelessWidget {
  final int emotion;
  final DateTime date;
  final List<double> symptomSeverity;
  HealthHistoryItem({
    Key? key,
    required this.emotion,
    required this.date,
    required this.symptomSeverity,
  }) : super(key: key);

  static List<String> iconList = EmotionReport.iconList;

  static String iconVirus = "assets/svg/virus.png";
  static String iconDown = "assets/svg/icon/down_arrow.svg";
  static String iconUp = "assets/svg/icon/up_arrow.svg";

  final String healthy = S.current.health_history_no_symptom;
  final String symptomTitle = S.current.health_history_symptom;
  static String sickPost = ".";
  static String connector1 = ", ";
  final String connector2 = S.current.and;

  final String day = S.current.day;

  final List<String> severity = [
    S.current.symptom_severity_1,
    S.current.symptom_severity_2,
    S.current.symptom_severity_3,
  ];

  final List<String> symptomNameList = [
    S.current.symptom_name_1,
    S.current.symptom_name_2,
    S.current.symptom_name_3,
    S.current.symptom_name_4,
    S.current.symptom_name_5,
    S.current.symptom_name_6,
    S.current.symptom_name_7,
    S.current.symptom_name_8,
  ];

  static List<Color> redgreen = [
    CustomColors.success,
    CustomColors.warning,
    CustomColors.error,
  ];

  final ExpandableController _controller = ExpandableController();

  static String edit(String str) {
    return str.replaceAll('\n', ' ').toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    bool isSick = false;
    List<int> ids = [0];

    for (int i = 0; i < symptomSeverity.length; i++)
      if (symptomSeverity[i] != 0) {
        isSick = true;
        ids.add(i + 1);
      }

    String content;
    if (isSick) {
      content = symptomTitle;

      List<int> symptomsExperienced = [];
      List<int> generalSeverity = [];

      for (int i = 0; i < 8; i++)
        if (symptomSeverity[i] != 0) {
          symptomsExperienced.add(i);
          generalSeverity
              .add(symptomSeverity[i] == 3 ? 2 : symptomSeverity[i].floor());
        }

      for (int i = 0; i < generalSeverity.length - 1; i++)
        content = content +
            edit(symptomNameList[symptomsExperienced[i]]) +
            severity[generalSeverity[i]] +
            connector1;
      if (symptomsExperienced.length > 0)
        content = content +
            connector2 +
            edit(symptomNameList[symptomsExperienced.last]) +
            severity[generalSeverity.last];

      content = content + sickPost;
    } else
      content = healthy;

    if (isSick)
      return Container(
        child: ExpandablePanel(
          controller: _controller,
          collapsed: openPanel(context, isSick, content, false),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: material.TextDirection.ltr,
            children: ids.map<Widget>((int value) {
              return value == 0
                  ? openPanel(context, isSick, content, true)
                  : Container(
                      width: 320.w,
                      color: getCustomColor().panelLight,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 80.w,
                            child: Text(
                              symptomNameList[value - 1],
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          slider(
                            context,
                            symptomSeverity[value - 1] / 3.0,
                          ),
                        ],
                      ),
                    );
            }).toList(),
          ),
        ),
      );
    else
      return openPanel(context, isSick, content, false);
  }

  Widget openPanel(
      BuildContext context, bool isSick, String content, bool isOpen) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.r,
              blurRadius: 1.5.r,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: getCustomColor().background,
          borderRadius: isOpen
              ? BorderRadius.vertical(top: Radius.circular(8.r))
              : BorderRadius.circular(8.r),
        ),
        margin: isOpen ? null : EdgeInsets.fromLTRB(0, 0, 0, 3),
        //width: 256.w,
        child: Row(
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  isSick ? iconVirus : iconList[emotion],
                  width: 64.h,
                  height: 64.h,
                  fit: BoxFit.fill,
                ),
                padding: EdgeInsets.all(8.h),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day +
                        DateFormat('Md', Intl.getCurrentLocale()).format(date),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    content,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: isSick ? (isOpen ? upIcon() : downIcon()) : null,
            ),
          ],
        ),
      ),
      margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
    );
  }

  Widget downIcon() {
    return BorderButton(
      width: 48.h,
      height: 48.h,
      margin: EdgeInsets.all(8.h),
      child: SvgPicture.asset(
        iconDown,
        width: 32.h,
        height: 32.h,
        fit: BoxFit.fill,
      ),
      onPressed: () {
        _controller.expanded = true;
      }, // TODO
    );
  }

  Widget upIcon() {
    return BorderButton(
      width: 48.h,
      height: 48.h,
      margin: EdgeInsets.all(8.h),
      child: SvgPicture.asset(
        iconUp,
        width: 32.h,
        height: 32.h,
        fit: BoxFit.fill,
      ),
      onPressed: () {
        _controller.expanded = false;
      }, // TODO
    );
  }

  Color lerpGradient(LinearGradient gradient, double t) {
    List<Color> colors = gradient.colors;
    List<double> stops = gradient.stops ?? [];

    int sections = colors.length - 1;
    if (stops.isEmpty)
      for (int i = 0; i <= sections; i++) stops.add(i / sections);
    if (stops.first != 0) stops.insert(0, 0);
    if (stops.last != 1) stops.add(1);

    for (var s = 0; s < stops.length - 1; s++) {
      final leftStop = stops[s], rightStop = stops[s + 1];
      final leftColor = colors[s], rightColor = colors[s + 1];
      if (t <= leftStop) {
        return leftColor;
      } else if (t < rightStop) {
        final sectionT = (t - leftStop) / (rightStop - leftStop);
        return Color.lerp(leftColor, rightColor, sectionT)!;
      }
    }
    return colors.last;
  }

  Widget slider(BuildContext context, double currentValue) {
    LinearGradient redgreenGradient = LinearGradient(
      colors: redgreen,
    );

    Color sliderThumbColor = lerpGradient(redgreenGradient, currentValue);

    return SliderTheme(
      data: SliderThemeData(
        trackShape: GradientRectSliderTrackShape(
          gradient: redgreenGradient,
        ),
        trackHeight: 16.h,
        thumbColor: sliderThumbColor,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 16.h,
          disabledThumbRadius: 0,
        ),
        disabledActiveTrackColor: Colors.black,
      ),
      child: Slider(
        value: currentValue,
        onChanged: null,
      ),
    );
  }
}
