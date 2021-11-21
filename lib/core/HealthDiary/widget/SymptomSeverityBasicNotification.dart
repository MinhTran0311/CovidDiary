import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
