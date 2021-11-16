import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';

class StatisticalTable extends StatelessWidget {
  final bool isVietnam;

  const StatisticalTable({Key? key, required this.isVietnam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: getCustomColor().panelDark,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: ListView(children: [
          Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              children: _buildRows(context)),
        ]),
      ),
    );
  }

  List<TableRow> _buildRows(BuildContext context) {
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");

    List<TableRow> list = [];
    list.add(TableRow(children: [
      Text(
        isVietnam
            ? S.current.disease_info_table_province
            : S.current.disease_info_table_nation,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: FontWeight.w700, color: getCustomColor().black),
      ),
      Text(
        S.current.disease_info_table_cases,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(fontWeight: FontWeight.w700, color: CustomColors.error),
      ),
      Text(
        S.current.disease_info_table_healed,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .caption!
            .copyWith(fontWeight: FontWeight.w700, color: CustomColors.success),
      ),
      Text(
        S.current.disease_info_table_deaths,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.caption!.copyWith(
            fontWeight: FontWeight.w700, color: getCustomColor().gray),
      ),
    ]));
    for (int i = 0; i < 64; i++) {
      list.add(
        TableRow(children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              isVietnam ? "Thành phố Hồ Chí Minh" : "USA",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.caption!.copyWith(
                  fontWeight: FontWeight.w400, color: getCustomColor().black),
            ),
          ),
          Text(
            '${(numberFormat.format(392115))}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700, color: CustomColors.error),
          ),
          Text(
            '${(numberFormat.format(69332))}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700, color: CustomColors.success),
          ),
          Text(
            '${(numberFormat.format(15069))}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                fontWeight: FontWeight.w700, color: getCustomColor().gray),
          ),
        ]),
      );
    }
    return list;
  }
}
