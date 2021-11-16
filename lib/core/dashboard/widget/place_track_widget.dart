import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/dashboard/widget/panel_header_widget.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/panel.dart';

class DBPlaceTrackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PanelLight(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        DBPanelHeader(title: S.current.dashboard_place_track),
        SizedBox(height: 8.h),
        Row(children: [
          Text(S.current.dashboard_place_you_visited,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().black)),
        ]),
        SizedBox(height: 8.h),
        _placeGrid(context),
        SizedBox(height: 8.h),
        Row(children: [
          Text(S.current.dashboard_more_place,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().primary))
        ]),
        SizedBox(height: 8.h),
        BorderButton(
          isAccent: true,
          width: 342.w,
          onPressed: () => {},
          buttonText: S.current.dashboard_place_track_button,
        ),
      ]),
    );
  }

  Widget _placeGrid(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        _placeCell(context, "Nhà Simmy", 21),
        _placeCell(context, "Net IMBA", 18),
        _placeCell(context, "Kho", 17),
        _placeCell(context, "Chợ gần nhà", 15),
        _placeCell(context, "Bách hóa xanh", 5),
        _placeCell(context, "Ngân hàng", 2),
        _placeCell(context, "Công ty", 1)
      ],
    );
  }

  Widget _placeCell(BuildContext context, String place, int timeVisit) {
    return Container(
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
            borderRadius: BorderRadius.all(
              Radius.circular(16.r),
            ),
            color: getCustomColor().panelDark));
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
