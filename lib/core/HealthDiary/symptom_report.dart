import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/core/HealthDiary/symptom_detail.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/non_fill_button.dart';

class SymptomReport extends StatefulWidget {
  const SymptomReport({
    Key? key,
  }) : super(key: key);

  @override
  _SymptomReportState createState() => _SymptomReportState();
}

class _SymptomReportState extends State<SymptomReport> {
  static List<String> iconList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  static List<String> noteList = [
    "Ho",
    "Sốt",
    "Khó thở",
    "Nôn / buồn nôn",
    "Đau đầu",
    "Đau họng",
    "Nổi ban ngoài da",
    "Tiêu chảy",
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
    ;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      items.add(
        // ButtonEmoticon
        Center(
          child: NonFillButton(
            onPressed: () => onSymptomPressed(i),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    iconList[i],
                    width: 48.w,
                    height: 48.h,
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
                )
              ],
            ),
            width: 130,
            height: 130,
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
                          "Dạo này bạn có bị gì không?",
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
                  Container(),
                ],
              ),
            ),
            Container(
              height: 72.h,
              padding: EdgeInsets.all(16),
              child: Expanded(
                child: CustomColorFillButton(
                  buttonText: "Xác nhận",
                  onPressed: onDone,
                  fillColor: getCustomColor().secondary,
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
    "green_circle.png",
    "yellow_circle.png",
    "red_circle.png",
  ];
  static List<String> iconListSeverityOn = [
    "green_circle_fill.png",
    "yellow_circle_fill.png",
    "red_circle_fill.png",
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
      width: 48.w,
      height: 88.h,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          severity == 0
              ? Image.asset(
                  iconListSeverityOn[severity],
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iconListSeverityOff[0],
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
          severity == 1
              ? Image.asset(
                  iconListSeverityOn[severity],
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iconListSeverityOff[1],
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
          severity == 2
              ? Image.asset(
                  iconListSeverityOn[severity],
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iconListSeverityOff[2],
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.fill,
                ),
        ],
      ),
    );
  }
}
