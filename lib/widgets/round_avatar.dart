import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class RoundAvatar extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderWidth;
  final bool isPicked;

  const RoundAvatar(
      {Key? key,
      required this.path,
      this.width,
      this.height,
      this.borderColor,
      this.backgroundColor,
      this.borderWidth,
      this.isPicked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100.w,
      height: height ?? 100.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: borderColor ?? getCustomColor().white,
            width: borderWidth ?? 3.w),
        color: backgroundColor ?? getCustomColor().white,
        image: DecorationImage(
            image: !isPicked
                ? AssetImage(path)
                : FileImage(File(path)) as ImageProvider,
            fit: BoxFit.contain),
      ),
    );
  }
}
