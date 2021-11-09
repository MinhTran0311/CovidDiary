import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class BasePanel extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? background;
  final Widget? child;
  final BuildContext? context;

  const BasePanel(
      {Key? key,
      this.height,
      this.width,
      this.background,
      this.child,
      this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? null,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        color: background ?? getCustomColor().background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: child),
    );
  }
}

class PanelLight extends BasePanel {
  PanelLight({
    double? height,
    double? width,
    Widget? child,
    BuildContext? context,
  }) : super(
          height: height,
          width: width,
          background: getCustomColor().panelLight,
          child: child,
        );
}

class PanelDark extends BasePanel {
  PanelDark({
    double? height,
    double? width,
    Widget? child,
    BuildContext? context,
  }) : super(
          height: height,
          width: width,
          background: getCustomColor().panelDark,
          child: child,
        );
}

class PanelMedium extends BasePanel {
  PanelMedium({
    double? height,
    double? width,
    Widget? child,
    BuildContext? context,
  }) : super(
          height: height,
          width: width,
          background: getCustomColor().panelMedium,
          child: child,
        );
}
