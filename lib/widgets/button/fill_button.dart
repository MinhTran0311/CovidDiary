import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/light_color.dart';
import 'package:src/commons/themes/theme.dart';

class FillButton extends StatelessWidget {
  final bool isAccent;

  final double? width;

  final double? height;

  final String? buttonText;

  final VoidCallback onPressed;

  final Widget? child;

  final Color? buttonColor;

  const FillButton(
      {Key? key,
      this.isAccent = false,
      this.width,
      this.height,
      this.buttonText,
      required this.onPressed,
      this.child,
      this.buttonColor})
      : assert((buttonText != null && child == null) ||
            (buttonText == null && child != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 48.h,
      width: this.width ?? 128.w,
      decoration: BoxDecoration(
        color: buttonColor != null
            ? buttonColor
            : (!this.isAccent
                ? getCustomColor().primary
                : getCustomColor().secondary),
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.r),
        color: buttonColor != null
            ? buttonColor
            : (!this.isAccent
            ? getCustomColor().primary
            : getCustomColor().secondary),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.r),
          onTap: onPressed,
          splashColor: getCustomColor().gray,
          splashFactory: InkSplash.splashFactory,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: (this.buttonText == null && this.child != null)
                  ? this.child!
                  : Text(
                buttonText!,
                style: Theme.of(context).textTheme.button!.copyWith(
                    color: lightColor.background),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
