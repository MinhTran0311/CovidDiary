import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';

class DBPanelHeader extends StatelessWidget {
  String? _title;
  String? _sideText;
  Widget? _sideIcon;

  @override
  DBPanelHeader({String? title, String? sideText, Widget? sideIcon, Key? key})
      : super(key: key) {
    _title = title ?? "Tiêu đề trống";
    _sideText = sideText ?? S.current.dashboard_detail;
    _sideIcon = sideIcon ??
        SvgPicture.asset(
          'assets/svg/icon/details.svg',
          width: 16.w,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_title!,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: getCustomColor().primary)),
            GestureDetector(
              child: Row(children: [
                Text(
                  _sideText!,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: getCustomColor().secondary),
                ),
                SizedBox(width: 4.w),
                _sideIcon!
              ]),
            )
          ],
        )
      ]),
    );
  }
}
