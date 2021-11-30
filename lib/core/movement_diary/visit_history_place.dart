import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/l10n/l10n.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:src/core/dashboard/widget/panel_header_widget.dart';
import 'package:src/core/dashboard/widget/place_track_item_widget.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/panel.dart';

class VisitHistoryPage extends StatelessWidget {
  const VisitHistoryPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        context: context,
        title: S.current.visit_history,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                children: [
                  _dayBlock(context, "Hôm nay 23/11/2021", true, true),
                  SizedBox(height: 8.h),
                  _dayBlock(context, "Hôm qua 22/11/2021", true, false),
                  SizedBox(height: 8.h),
                  _dayBlock(context, "Trong tuần này (22/11 - 23/11/2021)",
                      false, false),
                  SizedBox(height: 8.h),
                  _dayBlock(
                      context, "Từ 15/11/2021 đến 21/11/2021 ", false, false),
                  SizedBox(height: 8.h),
                ],
              )))
    ]);
  }

  Widget _dayBlock(
      BuildContext context, String title, bool isExpanded, bool markToday) {
    return PanelLight(
        child: ExpansionTile(
      initiallyExpanded: isExpanded,
      collapsedIconColor:
          markToday ? getCustomColor().secondary : getCustomColor().primary,
      iconColor:
          markToday ? getCustomColor().secondary : getCustomColor().primary,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            fontWeight: FontWeight.w600,
            color: markToday
                ? getCustomColor().secondary
                : getCustomColor().primary),
      ),
      children: [
        _placeCell(context, "Siêu thị", "23:59"),
        SizedBox(height: 8),
        _placeCell(context, "Siêu thị", "23:59"),
        SizedBox(height: 8),
        _placeCell(context, "Siêu thị", "23:59"),
        SizedBox(height: 8),
        _placeCell(context, "Siêu thị", "23:59"),
        SizedBox(height: 8),
        _placeCell(context, "Siêu thị", "23:59"),
        SizedBox(height: 8),
      ],
    ));
  }

  Widget _placeCell(BuildContext context, String placeName, String time) {
    return Row(children: [
      SizedBox(width: 8),
      Icon(Icons.place, color: getCustomColor().black),
      SizedBox(width: 8),
      Expanded(
          child: Text(
        placeName,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: getCustomColor().black),
      )),
      SizedBox(width: 8),
      Text(
        time,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: getCustomColor().black),
      ),
      SizedBox(width: 8)
    ]);
  }
}
