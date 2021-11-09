import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/panel.dart';

class DBTodayStatsWidget extends StatelessWidget {
  const DBTodayStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelLight(
      child: Column(children: [
        _tableTodayStats(context),
      ]),
    );
  }

  Widget _tableTodayStats(BuildContext context) {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
        },
        children: <TableRow>[
          TableRow(children: <Widget>[
            Text(
              S.current.login_with_phone,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().black),
            ),
            TableCell(
                child: FillButton(
              onPressed: () => {},
              buttonText: "Test",
            )),
            TableCell(
                child: FillButton(
              onPressed: () => {},
              buttonText: "Test",
            ))
          ])
        ]);
  }
}
