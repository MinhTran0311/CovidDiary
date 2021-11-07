import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/button/non_fill_button.dart';

class SymptomReport extends StatelessWidget {
  /// buttonColor: the color of the button
  /// height: the height of the button
  /// width: the width of the button
  /// buttonText: the text on the button. If you use child widget, don't fill this field
  /// child: the child widget of the button. Mutually exclusive with buttonText.
  /// fontColor: the font color of the text. defaults to black.
  const SymptomReport({
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
  static List<String> iconListSeverityOff = [
    "",
    "",
    "",
  ];
  static List<String> iconListSeverityOn = [
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
            Container(),
          ],
        )
      ],
    );
  }
}
