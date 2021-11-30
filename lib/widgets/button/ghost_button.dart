import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class GhostButton extends StatelessWidget {
  final bool isAccent;

  final double? width;

  final double? height;

  final String? buttonText;

  final VoidCallback onPressed;

  final Widget? child;

  const GhostButton(
      {Key? key,
      this.isAccent = false,
      this.width,
      this.height,
      this.buttonText,
      this.child,
      required this.onPressed})
      : assert((buttonText != null && child == null) ||
            (buttonText == null && child != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 48.h,
      width: this.width ?? 128.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: null,
        color: getCustomColor().background,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(8.r),
        color: getCustomColor().background,
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
                          color: !this.isAccent
                              ? getCustomColor().primary
                              : getCustomColor().secondary),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
