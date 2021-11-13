import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/core/HealthDiary/symptom_detail.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/outline_button.dart' as btn;

class _SymptomReport extends StatefulWidget {
  const _SymptomReport({
    Key? key,
    this.onDone,
  }) : super(key: key);

  final void Function(bool)? onDone;

  @override
  __SymptomReportState createState() => __SymptomReportState();
}

class __SymptomReportState extends State<_SymptomReport> {
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
  static List<String> noteList = [
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

  void onSymptomPressed(int id) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SymptomDetail(
                  symptom: id,
                  onDone: (severity) => setState(() {
                    symptomSeverity[id] = severity.floor();
                  }),
                  onCanceled: () => setState(() {
                    symptomSeverity[id] = 0;
                  }),
                )));
  }

  void onDone() {
    widget.onDone?.call(!symptomSeverity.any((element) => element != 0));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      items.add(
        // ButtonEmoticon
        Center(
          child: btn.OutlineButton(
            onPressed: () => onSymptomPressed(i),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    iconList[i],
                    width: 60.h,
                    height: 60.h,
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
            width: 130.w,
            height: 130.h,
          ),
        ),
      );
    }

    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: getCustomColor().bgGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        height: 64,
                        child: Text(
                          S.current.symptom_report_greeting,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: getCustomColor().primary),
                        ),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: getCustomColor().white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        alignment: Alignment.center,
                      ),
                      Expanded(child: Container()),
                    ],
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
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                height: 72.h,
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Spacer(),
                    Flexible(
                      flex: 14,
                      fit: FlexFit.tight,
                      child: CustomColorFillButton(
                        buttonText: S.current.confirm,
                        onPressed: onDone,
                        fillColor: getCustomColor().secondary,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SymptomSeverityBasicNotification extends StatelessWidget {
  static List<String> iconListSeverityOff = [
    "assets/svg/icon/green_circle.png",
    "assets/svg/icon/yellow_circle.png",
    "assets/svg/icon/red_circle.png",
  ];
  static List<String> iconListSeverityOn = [
    "assets/svg/icon/green_circle_fill.png",
    "assets/svg/icon/yellow_circle_fill.png",
    "assets/svg/icon/red_circle_fill.png",
  ];
  const SymptomSeverityBasicNotification({
    Key? key,
    required this.severity,
  })  : assert(severity >= 0 && severity < 3),
        super(key: key);
  final int severity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.h,
      height: 72.h,
      padding: EdgeInsets.fromLTRB(4.h, 8.h, 4.h, 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          severity == 0
              ? Image.asset(
                  iconListSeverityOn[severity],
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iconListSeverityOff[0],
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
          severity == 1
              ? Image.asset(
                  iconListSeverityOn[severity],
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iconListSeverityOff[1],
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
          severity == 2
              ? Image.asset(
                  iconListSeverityOn[severity],
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iconListSeverityOff[2],
                  width: 16.h,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
        ],
      ),
    );
  }
}

class SymptomReport extends StatefulWidget {
  const SymptomReport({
    Key? key,
  }) : super(key: key);

  @override
  _SymptomReportState createState() => _SymptomReportState();
}

class _SymptomReportState extends State<SymptomReport> {
  bool? isPositive;

  static const String closeSvg = "assets/svg/icon/close-r.svg";

  void onDone(bool isPositive) {
    // TODO: add to DB
    setState(() {
      this.isPositive = isPositive;
    });
  }

  void onNext() {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackedEntities = [
      _SymptomReport(
        onDone: onDone,
      ),
    ];
    if (isPositive != null) {
      stackedEntities.add(BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Container(
          color: getCustomColor().black.withOpacity(0.5),
        ),
      ));
      stackedEntities.add(Row(
        children: [
          Spacer(),
          Flexible(
            flex: 14,
            child: GestureDetector(
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
                        color: isPositive!
                            ? getCustomColor().primary
                            : getCustomColor().secondary),
                    color: getCustomColor().background,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          isPositive!
                              ? S.current.symptom_report_response_positive
                              : S.current.symptom_report_response_negative,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: isPositive!
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
                          width: 24.w,
                          color: isPositive!
                              ? getCustomColor().secondary
                              : getCustomColor().primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: onNext,
            ),
          ),
          Spacer()
        ],
      ));
    }

    return Stack(
      children: stackedEntities,
    );
  }
}
