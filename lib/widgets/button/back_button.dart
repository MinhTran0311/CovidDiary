import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/navigators/navigator.dart';

class ReturnButton extends StatelessWidget {
  final Widget? childIcon;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;
  final BuildContext? context;

  const ReturnButton(
      {Key? key,
      this.childIcon,
      this.backgroundColor,
      this.height,
      this.width,
      this.margin,
      this.onTap,
      this.context})
      : assert(!(onTap == null && context == null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: margin ?? EdgeInsets.only(top: 60.h, left: 32.w),
        child: GestureDetector(
          onTap: onTap ?? () => goBack(context),
          child: Container(
            height: height ?? 56.h,
            width: width ?? 56.h,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.white,
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment.center,
              child: childIcon ??
                  SvgPicture.asset('assets/svg/icon/arrow_left.svg'),
            ),
          ),
        ),
      ),
    );
  }
}
