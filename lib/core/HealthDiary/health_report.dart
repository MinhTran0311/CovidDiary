import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/core/HealthDiary/symptom_report.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/expanded_or_list_view.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/commons/navigators/navigator.dart';

class EmotionReport extends StatelessWidget {
  EmotionReport({Key? key}) : super(key: key);
  String get title => S.current.health_report_title;

  static const String closeSvg = "assets/svg/icon/close-r.svg";

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
  final List<String> noteList = [
    S.current.health_report_emotion_1,
    S.current.health_report_emotion_2,
    S.current.health_report_emotion_3,
    S.current.health_report_emotion_4,
    S.current.health_report_emotion_5,
    S.current.health_report_emotion_6,
    S.current.health_report_emotion_7,
    S.current.health_report_emotion_8,
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = getButtons(context);

    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(
          context: context,
          title: title,
        ),
        body: ExpandedOrListView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  height: 64,
                  child: Text(
                    S.current.health_report_emotion_greeting,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  items[0],
                  items[1],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  items[2],
                  items[3],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  items[4],
                  items[5],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  items[6],
                  items[7],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onNext(BuildContext context) {
    navigateTo(SymptomReport(), context);
  }

  Widget getResponseMessage(BuildContext context, bool isPositive) {
    return Row(
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
                            ? S.current.health_report_response_positive
                            : S.current.health_report_response_negative,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
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
                        height: 24.r,
                        width: 24.r,
                        color: isPositive
                            ? getCustomColor().secondary
                            : getCustomColor().primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              goBack(Scaffold.of(context).context);
              navigateTo(SymptomReport(), context);
            },
          ),
        ),
        Spacer()
      ],
    );
  }

  List<Widget> getButtons(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      items.add(
        // ButtonEmoticon
        Center(
          child: BorderButton(
            isAccent: i < 4,
            onPressed: () => showCustomDialog(
              context,
              getResponseMessage(context, i < 4),
            ),
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(8),
                  child: Image.asset(
                    iconList[i],
                    width: 64.r,
                    height: 64.r,
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
            width: 128.w,
            height: 128.h,
          ),
        ),
      );
    }
    return items;
  }
}
