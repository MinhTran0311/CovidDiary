import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

class HealthHistory extends StatelessWidget {
  const HealthHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
            AppBarCustom(context: context, title: "Lịch sử sức khoẻ"), //app bar
        body: Text("Homies"), //các widget khác
      ),
    );
  }
}

class HealthHistoryItem extends StatelessWidget {
  final int emotion;
  final DateTime date;
  final List<double> symptomSeverity;
  const HealthHistoryItem({
    Key? key,
    required this.emotion,
    required this.date,
    required this.symptomSeverity,
  }) : super(key: key);

  static List<String> symptomNameList = [
    edit(S.current.symptom_name_1),
    edit(S.current.symptom_name_2),
    edit(S.current.symptom_name_3),
    edit(S.current.symptom_name_4),
    edit(S.current.symptom_name_5),
    edit(S.current.symptom_name_6),
    edit(S.current.symptom_name_7),
    edit(S.current.symptom_name_8),
  ];

  static String edit(String str) {
    return str.replaceAll('\n', ' ').toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [],
      ),
    );
  }
}
