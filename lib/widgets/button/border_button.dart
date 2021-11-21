import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class BorderButton extends StatelessWidget {
  final bool isAccent;

  final double? width;

  final double? height;

  final String? buttonText;

  final VoidCallback onPressed;

  final Widget? child;

  final EdgeInsets? margin;

  final EdgeInsets? padding;

  const BorderButton(
      {Key? key,
      this.isAccent = false,
      this.width,
      this.height,
      this.buttonText,
      this.child,
      this.margin,
      this.padding,
      required this.onPressed})
      : assert((buttonText != null && child == null) ||
            (buttonText == null && child != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border.all(
            width: 2.w,
            color: !this.isAccent
                ? getCustomColor().primary
                : getCustomColor().secondary),
        color: getCustomColor().background,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextButton(
          child: (this.buttonText == null && this.child != null)
              ? this.child!
              : Text(
                  buttonText!,
                  style: Theme.of(context).textTheme.button!.copyWith(
                      color: !this.isAccent
                          ? getCustomColor().primary
                          : getCustomColor().secondary),
                ),
          onPressed: onPressed),
    );
  }
}
