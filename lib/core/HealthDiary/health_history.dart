import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/HealthDiary/symptom_detail.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

import 'health_report.dart';

class HealthHistory extends StatelessWidget {
  const HealthHistory({Key? key}) : super(key: key);

  static String title = "Lịch sử sức khoẻ";

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
  const HealthHistoryItem({
    Key? key,
    required this.emotion,
    required this.date,
    required this.symptomSeverity,
  }) : super(key: key);

  static List<String> iconList = EmotionReport.iconList;

  static String iconVirus = "assets/svg/virus.png";
  static String iconDown = "assets/svg/icon/down_arrow.svg";
  static String upDown = "assets/svg/icon/up_arrow.svg";

  static String healthy = "Hôm nay bạn khoẻ, không có triệu chứng gì hết!";

  static String sickPre = "Hôm nay bạn bị ";
  static String sickPost = ".";
  static String connector1 = ", ";
  static String connector2 = "và ";

  static String day = "Ngày ";

  static List<String> severity = [
    S.current.symptom_severity_1,
    S.current.symptom_severity_2,
    S.current.symptom_severity_3,
  ];

  static List<String> symptomNameList = [
    edit(S.current.symptom_name_1),
    edit(S.current.symptom_name_2),
    edit(S.current.symptom_name_3),
    edit(S.current.symptom_name_4),
    edit(S.current.symptom_name_5),
    edit(S.current.symptom_name_6),
    edit(S.current.symptom_name_7),
    edit(S.current.symptom_name_8),
  ];

  static String edit(String str) {
    return str.replaceAll('\n', ' ').toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    bool isSick = symptomSeverity.any((severity) => severity != 0);

    String content;
    if (isSick) {
      content = sickPre;

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
            symptomNameList[symptomsExperienced[i]] +
            severity[generalSeverity[i]] +
            connector1;
      if (symptomsExperienced.length > 0)
        content = content +
            connector2 +
            symptomNameList[symptomsExperienced.last] +
            severity[generalSeverity.last];

      content = content + sickPost;
    } else
      content = healthy;

    return Container(
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
        borderRadius: BorderRadius.circular(8.r),
      ),
      margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        children: [
          Center(
            child: Container(
              child: Image.asset(
                isSick ? iconVirus : iconList[emotion],
                width: 64.r,
                height: 64.r,
                fit: BoxFit.fill,
              ),
              padding: EdgeInsets.all(8.r),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  day + DateFormat('Md', Intl.getCurrentLocale()).format(date),
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Center(
            child: isSick
                ? BorderButton(
                    width: 54.r,
                    height: 54.r,
                    margin: EdgeInsets.all(8.r),
                    child: SvgPicture.asset(
                      iconDown,
                      width: 32.r,
                      height: 32.r,
                      fit: BoxFit.fill,
                    ),
                    onPressed: () {}, // TODO
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
