import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/core/HealthDiary/symptom_detail.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/HealthDiary/widget/SymptomSeverityBasicNotification.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/widgets/expanded_or_list_view.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

class SymptomReport extends StatefulWidget {
  const SymptomReport({
    Key? key,
    this.onDone,
  }) : super(key: key);

  final void Function(bool)? onDone;

  @override
  _SymptomReportState createState() => _SymptomReportState();
}

class _SymptomReportState extends State<SymptomReport> {
  static String closeSvg = "assets/svg/icon/close-r.svg";

  String get title => S.current.report_title;

  String get topQuestion => S.current.symptom_report_greeting;

  static List<String> iconList = [
    "assets/svg/icon/cough_ps.svg",
    "assets/svg/icon/fever_ps.svg",
    "assets/svg/icon/hiccup_ps.svg",
    "assets/svg/icon/vomiting_ps.svg",
    "assets/svg/icon/dizz_ps.svg",
    "assets/svg/icon/sore_throat_ps.svg",
    "assets/svg/icon/rash_ps.svg",
    "assets/svg/icon/diarrhea_ps.svg",
  ];
  List<String> noteList = [
    S.current.symptom_name_1,
    S.current.symptom_name_2,
    S.current.symptom_name_3,
    S.current.symptom_name_4,
    S.current.symptom_name_5,
    S.current.symptom_name_6,
    S.current.symptom_name_7,
    S.current.symptom_name_8,
  ];

  List<int> symptomSeverity = [0, 0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = buttonSymptom(context);
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(context: context, title: title), //app bar
        body: ExpandedOrListView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: buildTopQuestion(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [items[0], items[1]],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [items[2], items[3]],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [items[4], items[5]],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [items[6], items[7]],
              ),
              Expanded(
                child: confirmButton(context),
                flex: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSymptomPressed(int id) {
    navigateTo(
        SymptomDetail(
          symptom: id,
          onDone: (severity) => setState(() {
            symptomSeverity[id] = severity.ceil();
          }),
          onCanceled: () => setState(() {
            symptomSeverity[id] = 0;
          }),
        ),
        context);
  }

  void onDone() {
    widget.onDone?.call(!symptomSeverity.any((element) => element != 0));
  }

  List<Widget> buttonSymptom(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      items.add(
        // ButtonEmoticon
        Center(
          child: BorderButton(
            onPressed: () => onSymptomPressed(i),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    iconList[i],
                    width: 64.h,
                    height: 64.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    noteList[i],
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  child: symptomSeverity[i] > 0
                      ? SymptomSeverityBasicNotification(
                          severity: symptomSeverity[i] - 1,
                        )
                      : null,
                )
              ],
            ),
            width: 128.w,
            height: 128.h,
          ),
        ),
      );
    }
    return items;
  }

  Widget buildTopQuestion(BuildContext context) {
    return Center(
      child: Container(
        height: 64.h,
        child: Text(
          topQuestion,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: getCustomColor().primary),
        ),
        //padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: getCustomColor().white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        alignment: Alignment.center,
      ),
    );
  }

  Widget confirmButton(BuildContext context) {
    return Container(
      height: 72.h,
      child: Row(
        children: [
          Spacer(),
          Flexible(
            flex: 14,
            fit: FlexFit.tight,
            child: FillButton(
              buttonText: S.current.confirm,
              onPressed: () => showCustomDialog(
                context,
                responseMessage(
                    context, !symptomSeverity.any((item) => item != 0)),
              ),
              buttonColor: getCustomColor().secondary,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget responseMessage(BuildContext context, bool isPositive) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Spacer(),
            Flexible(
              flex: 14,
              child: Center(
                child: Container(
                  height: 128.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.r,
                        blurRadius: 1.5.r,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                        width: 2.w,
                        color: isPositive
                            ? getCustomColor().secondary
                            : getCustomColor().primary),
                    color: getCustomColor().background,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          isPositive
                              ? S.current.symptom_report_response_positive
                              : S.current.symptom_report_response_negative,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: isPositive
                                      ? getCustomColor().secondary
                                      : getCustomColor().primary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          closeSvg,
                          height: 24.h,
                          width: 24.h,
                          color: isPositive
                              ? getCustomColor().secondary
                              : getCustomColor().primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
      onTap: () {
        goBack(Scaffold.of(context).context);
        popToTop(context);
      },
    );
  }
}
