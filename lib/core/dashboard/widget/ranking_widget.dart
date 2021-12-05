import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/achievement/view/score_board.dart';
import 'package:src/core/dashboard/widget/panel_header_widget.dart';
import 'package:src/core/dashboard/widget/place_track_item_widget.dart';
import 'package:src/core/movement_diary/visit_history_place.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/panel.dart';
import 'package:src/widgets/round_avatar.dart';

class DBRankingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PanelLight(
      child: Column(children: [
        DBPanelHeader(
          title: S.current.dashboard_ranking,
          onPressed: () {
            navigateTo(ScoreBoard(), context);
          },
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(0.7),
                1: FlexColumnWidth(7),
                2: FlexColumnWidth(1),
              },
              children: [
                _rankCell(context, 1, "Oanh Lâm", 10),
                _rankCell(context, 2, "Oanh Lâm", 9),
                _rankCell(context, 3, "Oanh Lâm", 8),
                TableRow(children: [
                  Divider(height: 2),
                  Divider(height: 2),
                  Divider(height: 2),
                ]),
                _rankCell(context, 99, "Siêu nhân cuồng phong", 2, true),
              ]),
        )
      ]),
    );
  }

  TableRow _rankCell(BuildContext context, int rank, String name, int score,
      [bool isUser = false]) {
    return TableRow(children: [
      Text(rank.toString(),
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600, color: _getColorByRank(rank))),
      Row(
        children: [
          SizedBox(width: 8),
          RoundAvatar(
            path: "assets/svg/avatar.png",
            width: 48.w,
            height: 48.h,
          ),
          SizedBox(width: 4),
          Expanded(
            child: Text((isUser ? "(Bạn) " : "") + name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: isUser ? FontWeight.w600 : FontWeight.normal,
                    color: getCustomColor().black)),
          ),
          SizedBox(width: 8),
        ],
      ),
      Container(
        child: Row(children: [
          SvgPicture.asset(
            "assets/svg/icon/heart.svg",
            width: 16.r,
            height: 16.r,
            color: getCustomColor().secondary,
          ),
          SizedBox(width: 4),
          Text(score.toString(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: getCustomColor().secondary)),
        ]),
      ),
    ]);
  }

  Color _getColorByRank(int rank) {
    switch (rank) {
      case 1:
        return CustomColors.warning;
      case 2:
        return getCustomColor().gray;
      case 3:
        return getCustomColor().secondary;
      default:
        return getCustomColor().black;
    }
  }
}
