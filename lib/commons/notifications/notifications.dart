import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/light_color.dart';

void snackBar(
  BuildContext context,
  String text, {
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 3,
      content: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: lightColor.background),
        textAlign: TextAlign.center,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
      ),
      duration: Duration(seconds: 4),
      backgroundColor: backgroundColor ?? CustomColors.success,
    ),
  );
}
