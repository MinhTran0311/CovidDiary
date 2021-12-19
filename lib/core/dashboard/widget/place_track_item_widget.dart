import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';

class PlaceTrackItemWidget extends StatelessWidget {
  PlaceTrackItemWidget({
    Key? key,
    required this.place,
    required this.timeVisit,
    this.onPress,
    this.borderColor,
  }) : super(key: key);

  final String place;
  final int timeVisit;
  final void Function()? onPress;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 46.h,
        child: Container(
            child: Row(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(width: 8.w),
          Text(place,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: getCustomColor().black)),
          SizedBox(width: 4.w),
          _visitTimeTag(context, timeVisit),
          SizedBox(width: 8.w)
        ])),
        decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? getCustomColor().panelDark,
              width: 2.r,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            color: getCustomColor().panelDark),
      ),
      onTap: onPress,
    );
  }

  Widget _visitTimeTag(BuildContext context, int timeVisit) {
    return Container(
        height: 30.h,
        child: Center(
            child: Row(children: [
          SizedBox(width: 8.w),
          Text(timeVisit.toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: getCustomColor().background)),
          SizedBox(width: 8.w)
        ])),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(100.r),
            ),
            color: _getColorTimeVisit(timeVisit)));
  }

  Color _getColorTimeVisit(int timeVisit) {
    switch (timeVisit ~/ 5) {
      case 0:
        return getCustomColor().primary;
      case 1:
        return CustomColors.success;
      case 2:
        return CustomColors.warning;
      default:
        return CustomColors.error;
    }
  }
}
