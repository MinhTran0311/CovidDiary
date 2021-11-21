import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/expanded_or_list_view.dart';
import 'package:src/widgets/gradientSliderShape.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

class SymptomDetail extends StatefulWidget {
  const SymptomDetail({
    Key? key,
    required this.symptom,
    required this.onDone,
    required this.onCanceled,
    this.initialSeverity = 0,
  }) : super(key: key);

  final int symptom;
  final void Function(double) onDone;
  final void Function() onCanceled;
  final double initialSeverity;

  @override
  _SymptomDetailState createState() =>
      _SymptomDetailState(currentValue: initialSeverity);
}

class _SymptomDetailState extends State<SymptomDetail> {
  _SymptomDetailState({this.currentValue = 0}) : super();

  int get symptom => widget.symptom;

  String get title => S.current.report_title;

  static List<String> iconList = [
    "assets/svg/icon/cough_ws.svg",
    "assets/svg/icon/fever_ws.svg",
    "assets/svg/icon/hiccup_ws.svg",
    "assets/svg/icon/vomiting_ws.svg",
    "assets/svg/icon/dizz_ws.svg",
    "assets/svg/icon/sore_throat_ws.svg",
    "assets/svg/icon/rash_ws.svg",
    "assets/svg/icon/diarrhea_ws.svg",
  ];

  List<String> symptomNameList = [
    S.current.symptom_name_1,
    S.current.symptom_name_2,
    S.current.symptom_name_3,
    S.current.symptom_name_4,
    S.current.symptom_name_5,
    S.current.symptom_name_6,
    S.current.symptom_name_7,
    S.current.symptom_name_8,
  ];

  List<String> severity = [
    S.current.symptom_severity_1,
    S.current.symptom_severity_2,
    S.current.symptom_severity_3,
  ];

  List<List<String>> symptomInfo = [
    [
      S.current.symptom_info_1_1,
      S.current.symptom_info_1_2,
      S.current.symptom_info_1_3,
    ],
    [
      S.current.symptom_info_2_1,
      S.current.symptom_info_2_2,
      S.current.symptom_info_2_3,
    ],
    [
      S.current.symptom_info_3_1,
      S.current.symptom_info_3_2,
      S.current.symptom_info_3_3,
    ],
    [
      S.current.symptom_info_4_1,
      S.current.symptom_info_4_2,
      S.current.symptom_info_4_3,
    ],
    [
      S.current.symptom_info_5_1,
      S.current.symptom_info_5_2,
      S.current.symptom_info_5_3,
    ],
    [
      S.current.symptom_info_6_1,
      S.current.symptom_info_6_2,
      S.current.symptom_info_6_3,
    ],
    [
      S.current.symptom_info_7_1,
      S.current.symptom_info_7_2,
      S.current.symptom_info_7_3,
    ],
    [
      S.current.symptom_info_8_1,
      S.current.symptom_info_8_2,
      S.current.symptom_info_8_3,
    ],
  ];

  List<String> generalSymptomInfo = [
    "Ho là một trong những triệu chứng quan trọng nhất của Covid 19, mặc dù có rất nhiều bệnh cũng có triệu chứng này.",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  List<String Function(String)> governmentAdvice = [
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

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(context: context, title: title), //app bar
        body: ExpandedOrListView(
          child: Column(
            children: [
              Center(
                child: topQuestion(context),
              ),
              Center(
                child: symptomPicture(context),
              ),
              slider(context),
              symptomDetailInfo(context),
              symptomGeneralInfo(context),
              Spacer(),
              bottomBar(context),
            ],
          ),
        ),
      ),
    );
  }

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

  String replaceNewLine(String str) {
    return str.replaceAll('\n', ' ');
  }

  void onCancel() {
    widget.onCanceled();
    goBack(context);
  }

  void onDone() {
    widget.onDone(currentValue * 3);
    goBack(context);
  }

  int currentSeverity = 0;
  double currentValue;
  void onSliderChanged(double slider) {
    int value = (slider * 3).floor();
    if (value == 3) value--;
    setState(() {
      currentSeverity = value;
      currentValue = slider;
    });
  }

  static List<Color> redgreen = [
    CustomColors.success,
    CustomColors.warning,
    CustomColors.error,
  ];

  Widget topQuestion(BuildContext context) {
    return Container(
      height: 96,
      child: Text(
        "Bạn bị ${replaceNewLine(symptomNameList[symptom]).toLowerCase()} à?\n" +
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
    );
  }

  Widget symptomPicture(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        iconList[symptom],
        width: 96.w,
        height: 96.h,
        fit: BoxFit.fill,
      ),
      width: 96,
      height: 96,
    );
  }

  Widget slider(BuildContext context) {
    LinearGradient redgreenGradient = LinearGradient(
      colors: redgreen,
    );

    Color sliderThumbColor = lerpGradient(redgreenGradient, currentValue);

    return SliderTheme(
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
    );
  }

  Widget symptomDetailInfo(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              replaceNewLine(symptomNameList[symptom]) +
                  severity[currentSeverity],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: redgreen[currentSeverity],
                  ),
            ),
          ),
          Container(height: 8.h),
          Text(
            symptomInfo[symptom][currentSeverity],
            style: Theme.of(context).textTheme.headline6!,
          ),
        ],
      ),
    );
  }

  Widget symptomGeneralInfo(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Triệu chứng ${replaceNewLine(symptomNameList[symptom]).toLowerCase()} của Covid 19",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: getCustomColor().primary),
            ),
          ),
          Container(height: 8.h),
          Center(
            child: Text(
              generalSymptomInfo[symptom],
              style: Theme.of(context).textTheme.headline6!,
            ),
          ),
          Container(height: 8.h),
          Center(
            child: Text(
              governmentAdvice[governmentAdviceType[symptom]](
                  replaceNewLine(symptomNameList[symptom]).toLowerCase()),
              style: Theme.of(context).textTheme.headline6!,
            ),
          )
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Container(
      height: 72.h,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FillButton(
              height: 40.h,
              width: 160.w,
              buttonText: S.current.confirm_cancel,
              onPressed: onCancel,
              buttonColor: CustomColors.error,
            ),
            FillButton(
              height: 40.h,
              width: 160.w,
              buttonText: S.current.confirm,
              onPressed: onDone,
              buttonColor: CustomColors.success,
            ),
          ],
        ),
      ),
    );
  }
}
