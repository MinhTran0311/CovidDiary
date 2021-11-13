import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class CategoryTabBar extends StatefulWidget {
  final String title;
  final VoidCallback? callBack;
  final bool isSelected;

  const CategoryTabBar(
      {Key? key, required this.title, this.callBack, required this.isSelected})
      : super(key: key);

  @override
  _CategoryTabBarState createState() => _CategoryTabBarState();
}

class _CategoryTabBarState extends State<CategoryTabBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callBack,
      child: Container(
        width: 110.w,
        height: 30.h,
        decoration: BoxDecoration(
          color: widget.isSelected
              ? getCustomColor().background
              : getCustomColor().primary,
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
        child: Center(
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: widget.isSelected
                    ? getCustomColor().primary
                    : getCustomColor().white),
          ),
        ),
      ),
    );
  }
}
