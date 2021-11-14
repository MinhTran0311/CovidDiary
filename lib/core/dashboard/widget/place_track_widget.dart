import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/dashboard/widget/panel_header_widget.dart';
import 'package:src/widgets/panel.dart';

class DBPlaceTrackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PanelLight(
      child: Column(children: [
        DBPanelHeader(title: S.current.dashboard_place_track),
        Row(children: [
          Text(S.current.dashboard_place_you_visited,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().black)),
        ]),
        SizedBox(height: 8.h),
      ]),
    );
  }
}
