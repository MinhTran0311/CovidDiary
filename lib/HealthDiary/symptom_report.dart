import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/button/elevated_button.dart';

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
  static List<String> severity = [
    " nhẹ",
    " vừa",
    " nặng",
  ];
  static List<List<String>> symptomInfo = [
    [
      "Thi thoảng, bạn bị ho một cái.\n" +
          "Có thể nó không đủ để coi như là bị bệnh, " +
          "nhưng nó có làm phiền bạn một chút ít.",
      "Bạn cảm giác như bạn bị cảm.\n" +
          "Bạn ho đủ nhiều để khiến bạn khó chịu, " +
          "và khả năng cao nếu bạn không mắc Covid thì bạn cũng bị cảm hay gì đó.",
      "Bạn ho thường xuyên.\n" +
          "Thường xuyên đến nỗi bạn bắt đầu thấy mệt.\n" +
          "Có lẽ đến mức này, bạn rất nên đi khám bệnh.",
    ],
    [
      "Bạn bị sốt 37-38 độ C.\n" +
          "Sốt có thể khiến bạn mệt một chút, " +
          "Nhưng không gì quá nặng.",
      "Bạn bị sốt 38-39 độ C.\n" +
          "Đợt sốt này khiến bạn quá mệt để làm việc gì nặng, " +
          "và bạn nên nghỉ bệnh hôm nay.",
      "Bạn bị sốt 39+ độ C.\n" +
          "Bạn bị sốt nặng, " +
          "và nên uống thuốc hạ sốt để giữ thân nhiệt thấp.",
    ],
    [
      "Bạn bị tức ngực, nghẹt mũi, hay khó thở nói chung.\n" +
          "Bạn phải thở mạnh hơn bình thường, " +
          "và nó có thể khó chịu một chút, " +
          "nhưng chưa ảnh hưởng lớn đến khả năng hô hấp.",
      "Bạn bị khó thở.\nThi thoảng bạn phải thở dốc vì thiếu oxy.",
      "Bạn bị khó thở nặng.\n" +
          "Bạn đã ngất ít nhất 1 lần trong ngày vì thiếu oxy.\n" +
          "Nếu bạn chưa đến bệnh viện thì bạn nên đến đó đi.",
    ],
    [
      "Nhiều lúc trong ngày, bạn thấy muốn ói.",
      "Bạn đã ói 1 lần trong ngày.",
      "Bạn đã ói nhiều lần trong ngày.\n" +
          "Bạn nên ăn uống đầy đủ để đảm bảo dinh dưỡng.\n" +
          "Có khi bạn nên đi khám",
    ],
    [
      "Bạn cảm thấy nhức đầu.\n" +
          "Chuyện bình thường nếu hôm nay bạn làm việc quá sức.",
      "Bạn cảm thấy chóng mặt.\n" + "Có thể bạn sẽ ngã xuống bất cứ lúc nào.",
      "Bạn cảm thấy đau đầu.\n" +
          "Có thể nó đau nhói, có thể nó đau giai giẳng, " +
          "nhưng nó dường như sẽ không bớt đi sớm nếu bạn không đi khám.",
    ],
    [
      "Bạn cảm thấy khô họng.\n" + "Nhớ uống đủ nước nha bạn.",
      "Bạn cảm thấy ngứa họng.\n" +
          "Bạn có thể muốn ho." +
          "Khi đó, nhớ che miệng hoặc ho vào khuỷu tay, và rửa tay thường xuyên.",
      "Bạn cảm thấy đau họng.\n" +
          "Bạn có thể bị khàn tiếng.\n" +
          "Có lẽ bạn nên đi khám.",
    ],
    [
      "",
    ],
  ];
  static List<String Function(String)> governmentAdvice = [
    (str) =>
        "Theo khuyến cáo của chính phủ, nếu bạn bị $str, " +
        "bạn nên theo dõi các triệu chứng này. " +
        "Nếu gần đây, bạn có tiếp xúc với người nhiễm Covid 19, " +
        "bạn nên xét nghiệm với bộ test Covid 19.",
    (str) =>
        "Theo khuyến cáo của chính phủ, nếu bạn bị $str, " +
        "bạn nên tìm trợ giúp y tế ngay lập tức.",
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 8; i++) {
      items.add(
        // ButtonEmoticon
        Center(
          child: RoundedButton(
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
                )
              ],
            ),
            width: 130,
            height: 130,
          ),
        ),
      );
    }

    return Expanded(
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [
          Container(
              // Top bar
              ),
          Column(
            children: [
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
          )
        ],
      ),
    );
  }
}
