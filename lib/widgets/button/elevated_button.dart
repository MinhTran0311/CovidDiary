import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final Color? buttonColor;

  final double? width;

  final double? height;

  final String? buttonText;

  final VoidCallback? onPressed;

  final Widget? child;

  final Color? fontColor;

  /// buttonColor: the color of the button
  /// height: the height of the button
  /// width: the width of the button
  /// buttonText: the text on the button. If you use child widget, don't fill this field
  /// child: the child widget of the button. Mutually exclusive with buttonText.
  /// fontColor: the font color of the text. defaults to black.
  const RoundedButton(
      {Key? key,
      this.buttonColor,
      required this.height,
      this.buttonText,
      this.onPressed,
      required this.width,
      this.child,
      this.fontColor})
      : assert((buttonText != null && child == null) ||
            (buttonText == null && child != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
          color: this.buttonColor ?? Colors.blue,
          borderRadius: BorderRadius.circular(8.r)),
      child: TextButton(
          child: (this.buttonText == null && this.child != null)
              ? this.child!
              : Text(
                  buttonText!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: this.fontColor ?? Colors.black),
                ),
          onPressed: onPressed),
    );
  }
}
