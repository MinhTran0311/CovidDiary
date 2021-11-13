import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/core/HealthDiary/symptom_report.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/outline_button.dart' as btn;

class _EmotionReport extends StatelessWidget {
  /// buttonColor: the color of the button
  /// height: the height of the button
  /// width: the width of the button
  /// buttonText: the text on the button. If you use child widget, don't fill this field
  /// child: the child widget of the button. Mutually exclusive with buttonText.
  /// fontColor: the font color of the text. defaults to black.
  const _EmotionReport({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  static List<String> iconList = [
    "assets/svg/icon/wink.png",
    "assets/svg/icon/happy.png",
    "assets/svg/icon/good.png",
    "assets/svg/icon/excited.png",
    "assets/svg/icon/sick.png",
    "assets/svg/icon/sad.png",
    "assets/svg/icon/bored.png",
    "assets/svg/icon/angry.png",
  ];
  static List<String> noteList = [
    S.current.health_report_emotion_1,
    S.current.health_report_emotion_2,
    S.current.health_report_emotion_3,
    S.current.health_report_emotion_4,
    S.current.health_report_emotion_5,
    S.current.health_report_emotion_6,
    S.current.health_report_emotion_7,
    S.current.health_report_emotion_8,
  ];

  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      items.add(
        // ButtonEmoticon
        Center(
          child: btn.OutlineButton(
            isAccent: i < 4,
            onPressed: () => onPressed(i),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
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
                  ),
                ),
              ],
            ),
            width: 128,
            height: 128,
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
            Row(
              children: [
                Expanded(child: Container()),
                Container(
                  height: 64,
                  child: Text(
                    S.current.health_report_emotion_greating,
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
            Expanded(child: Container()),
            Row(children: [
              Expanded(child: Container()),
              items[0],
              Expanded(child: Container()),
              items[1],
              Expanded(child: Container()),
            ]),
            Expanded(child: Container()),
            Row(children: [
              Expanded(child: Container()),
              items[2],
              Expanded(child: Container()),
              items[3],
              Expanded(child: Container()),
            ]),
            Expanded(child: Container()),
            Row(children: [
              Expanded(child: Container()),
              items[4],
              Expanded(child: Container()),
              items[5],
              Expanded(child: Container()),
            ]),
            Expanded(child: Container()),
            Row(children: [
              Expanded(child: Container()),
              items[6],
              Expanded(child: Container()),
              items[7],
              Expanded(child: Container()),
            ]),
            Expanded(child: Container()),
          ],
        ),
      ],
    );
  }
}

class EmotionReport extends StatefulWidget {
  const EmotionReport({
    Key? key,
  }) : super(key: key);

  @override
  _EmotionReportState createState() => _EmotionReportState();
}

class _EmotionReportState extends State<EmotionReport> {
  bool? isPositive;

  static const String closeSvg = "assets/svg/icon/close-r.svg";

  void onClick(int value) {
    // TODO: add to DB
    setState(() {
      isPositive = value < 4;
    });
  }

  void onNext() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SymptomReport(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackedEntities = [
      _EmotionReport(
        onPressed: onClick,
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
                              ? S.current.health_report_response_positive
                              : S.current.health_report_response_negative,
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
