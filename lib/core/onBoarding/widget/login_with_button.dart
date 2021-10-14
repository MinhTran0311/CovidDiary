import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class LoginWithButton extends StatelessWidget {
  final Color? buttonColor;

  final double? width;

  final double? height;

  final Text buttonText;

  final VoidCallback? onPressed;

  final Widget icon;

  final bool isGoogleDark;

  const LoginWithButton(
      {Key? key,
      this.buttonColor,
      this.height,
      required this.buttonText,
      this.onPressed,
      this.width,
      required this.icon,
      this.isGoogleDark = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Ink(
        height: this.height,
        width: this.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          color: this.buttonColor ?? getCustomColor().primary,
        ),
        child: buildBtnLoginWith(),
      ),
    );
  }

  Widget buildBtnLoginWith() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Row(
        children: [
          Container(
            width: 32.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: this.isGoogleDark ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: this.icon,
          ),
          SizedBox(width: 16.w),
          this.buttonText,
        ],
      ),
    );
  }
}
