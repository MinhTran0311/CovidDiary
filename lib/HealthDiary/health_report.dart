import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/light_color.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/non_fill_button.dart';

class HealthReport extends StatelessWidget {
  /// buttonColor: the color of the button
  /// height: the height of the button
  /// width: the width of the button
  /// buttonText: the text on the button. If you use child widget, don't fill this field
  /// child: the child widget of the button. Mutually exclusive with buttonText.
  /// fontColor: the font color of the text. defaults to black.
  const HealthReport({
    Key? key,
  }) : super(key: key);

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
    "Vui vẻ",
    "Hài lòng",
    "Thoải mái",
    "Phấn khởi",
    "Mệt mỏi",
    "Buồn",
    "Chán nản",
    "Bực bội",
  ];

  void OnPressed(int id) {
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
            isAccent: i < 4,
            onPressed: () => OnPressed(i),
            child: Stack(
              children: [
                Center(
                  child: iconList[i] != "" ? Image.asset(iconList[i]) : null,
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

    return Expanded(
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: getCustomColor().bgGradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
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
                      "Hôm nay bạn thấy thế nào?",
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
      ),
    );
  }
}
