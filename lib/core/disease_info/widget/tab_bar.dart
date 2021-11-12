import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class RoundTabBar extends StatefulWidget {
  final String iconPath;
  final String title;
  final VoidCallback? callBack;
  final bool isSelected;

  const RoundTabBar(
      {Key? key,
      required this.iconPath,
      required this.title,
      this.callBack,
      required this.isSelected})
      : super(key: key);

  @override
  _RoundTabBarState createState() => _RoundTabBarState();
}

class _RoundTabBarState extends State<RoundTabBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: Container(
        width: 150.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: getCustomColor().background,
          boxShadow: [
            BoxShadow(
              color: widget.isSelected
                  ? Colors.grey.withOpacity(0.5)
                  : Colors.transparent,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(
              color: widget.isSelected
                  ? getCustomColor().primary
                  : Colors.transparent,
              width: 1.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.iconPath),
            SizedBox(width: 8.w),
            Text(widget.title, style: Theme.of(context).textTheme.headline6)
          ],
        ),
      ),
    );
  }
}
