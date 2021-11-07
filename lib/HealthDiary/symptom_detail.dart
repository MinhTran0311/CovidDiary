import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/gradientSliderShape.dart';

class SymptomDetail extends StatefulWidget {
  const SymptomDetail(
      {Key? key, required this.symptom, required this.onSliderChange})
      : super(key: key);

  final int symptom;
  final void Function(double) onSliderChange;

  @override
  _SymptomReportState createState() => _SymptomReportState();
}

class _SymptomReportState extends State<SymptomDetail> {
  /// buttonColor: the color of the button
  /// height: the height of the button
  /// width: the width of the button
  /// buttonText: the text on the button. If you use child widget, don't fill this field
  /// child: the child widget of the button. Mutually exclusive with buttonText.
  /// fontColor: the font color of the text. defaults to black.

  int get symptom => widget.symptom;
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
  static List<String> symptomNameList = [
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
  static List<String> generalSymptomInfo = [
    "Ho là một trong những triệu chứng quan trọng nhất của Covid 19, mặc dù có rất nhiều bệnh cũng có triệu chứng này.",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
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
  static List<int> governmentAdviceType = [0, 0, 1, 0, 0, 0, 1, 0];

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

  void OnPressed(int id) {
    ;
  }

  int currentSeverity = 0;
  double currentValue = 0;
  void onSliderChanged(double slider) {
    int value = (slider * 3).floor();
    if (value == 3) value--;
    setState(() {
      currentSeverity = value;
      currentValue = slider;
    });
    widget.onSliderChange(slider);
  }

  static List<Color> redgreen = [
    CustomColors.success,
    CustomColors.warning,
    CustomColors.error,
  ];
  @override
  Widget build(BuildContext context) {
    LinearGradient redgreenGradient = LinearGradient(
      colors: redgreen,
    );

    Color sliderThumbColor = lerpGradient(redgreenGradient, currentValue);

    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        //*
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: getCustomColor().bgGradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // */
        Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    height: 96,
                    child: Text(
                      "Bạn bị ${symptomNameList[symptom]} à?\n" +
                          "Có nặng không?",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: getCustomColor().primary),
                      textAlign: TextAlign.center,
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
              Center(
                child: Container(
                  child: iconList[symptom] != ""
                      ? Image.asset(iconList[symptom])
                      : null,
                  width: 96,
                  height: 96,
                ),
              ),
              //*
              SliderTheme(
                data: SliderThemeData(
                  trackShape: GradientRectSliderTrackShape(
                    gradient: redgreenGradient,
                  ),
                  trackHeight: 16.h,
                  thumbColor: sliderThumbColor,
                  thumbShape: RoundSliderThumbShape(
                    enabledThumbRadius: 16.h,
                  ),
                ),
                child: Slider(
                  value: currentValue,
                  onChanged: onSliderChanged,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: getCustomColor().background,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        symptomNameList[symptom] + severity[currentSeverity],
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: redgreen[currentSeverity],
                            ),
                      ),
                    ),
                    Center(
                      child: Text(
                        symptomInfo[symptom][currentSeverity],
                        style: Theme.of(context).textTheme.headline6!,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: getCustomColor().background,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Triệu chứng ${symptomNameList[symptom]} của Covid 19",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: getCustomColor().primary),
                      ),
                    ),
                    Center(
                      child: Text(
                        generalSymptomInfo[symptom],
                        style: Theme.of(context).textTheme.headline6!,
                      ),
                    ),
                    Center(
                      child: Text(
                        governmentAdvice[governmentAdviceType[symptom]](
                            symptomNameList[symptom]),
                        style: Theme.of(context).textTheme.headline6!,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
  }
}
