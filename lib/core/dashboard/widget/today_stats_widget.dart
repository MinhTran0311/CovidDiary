import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/base/app_navigator.dart';
import 'package:src/core/dashboard/widget/panel_header_widget.dart';
import 'package:src/widgets/panel.dart';

class DBTodayStatsWidget extends StatelessWidget {
  const DBTodayStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelLight(
      child: Column(children: [
        DBPanelHeader(
          title: S.current.dashboard_today_stats,
          onPressed: () {
            // print("123");
            // Scaffold.of(context).setState(() {
            //   AppNavigator.changeTab(1);
            // });
          },
        ),
        _tableTodayStats(context),
      ]),
    );
  }

  Widget _tableTodayStats(BuildContext context) {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: <TableRow>[
          TableRow(children: <Widget>[
            _getTableCell(null),
            _getTableCell(Text(
              S.current.dashboard_infected,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().black),
            )),
            _getTableCell(Text(
              S.current.dashboard_recovered,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().black),
            )),
          ]),
          _getRowTodayStat(
              context,
              Row(
                children: [
                  Expanded(
                      child: SvgPicture.asset('assets/svg/icon/globe.svg',
                          height: 24.h)),
                  Container(
                      alignment: Alignment.center,
                      width: 64.w,
                      child: Text(S.current.dashboard_world,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: getCustomColor().black)))
                ],
              ),
              _randomNum(),
              _randomNum()),
          _getRowTodayStat(
              context,
              Row(
                children: [
                  Expanded(
                      child: SvgPicture.asset('assets/svg/icon/vietnam.svg',
                          height: 24.h)),
                  Container(
                      alignment: Alignment.center,
                      width: 64.w,
                      child: Text(S.current.dashboard_vn,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: getCustomColor().black)))
                ],
              ),
              _randomNum(),
              _randomNum()),
        ]);
  }

  int _randomNum() {
    int min = 0;
    int max = 100;
    return min + Random().nextInt(max - min);
  }

  TableRow _getRowTodayStat(
      BuildContext context, Widget header, int infected, int recovered) {
    return TableRow(children: <Widget>[
      _getTableCell(header),
      _getTableCell(Text(
        infected.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w600, color: CustomColors.error),
      )),
      _getTableCell(Text(
        recovered.toString(),
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: FontWeight.w600, color: CustomColors.success),
      ))
    ]);
  }

  Container _getTableCell(Widget? child) {
    return Container(
      height: 32.h,
      alignment: Alignment.center,
      child: child,
    );
  }
}
