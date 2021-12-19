import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/themes/theme.dart';

class CheckBox extends StatefulWidget {
  final String text;
  final double? width;
  final bool hasBottomMargin;

  const CheckBox(
      {Key? key, required this.text, this.width, this.hasBottomMargin = true})
      : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool isCheck;

  @override
  void initState() {
    super.initState();
    isCheck = false;
  }

  @override
  void didUpdateWidget(CheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    isCheck = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.hasBottomMargin
          ? EdgeInsets.symmetric(vertical: 8.h)
          : EdgeInsets.only(top: 8.h),
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: getCustomColor().panelMedium),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: Text(widget.text,
                    style: Theme.of(context).textTheme.bodyText1, maxLines: 3),
              ),
              SizedBox(width: 16.w),
              Align(child: _buildCheckBox(), alignment: Alignment.centerRight)
            ]),
      ),
    );
  }

  Widget _buildCheckBox() {
    return InkWell(
      onTap: () {
        isCheck = !isCheck;
        this.setState(() {});
      },
      child: Stack(children: [
        Center(
          child: Container(
            width: 32.r,
            height: 32.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: getCustomColor().background,
                border: Border.all(width: 1, color: getCustomColor().primary)),
          ),
        ),
        if (isCheck)
          Center(
            child: SvgPicture.asset("assets/svg/icon/check.svg",
                width: 28.r, height: 28.r),
          )
      ]),
    );
  }
}
