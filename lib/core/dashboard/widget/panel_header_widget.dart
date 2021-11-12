import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/button/ghost_button.dart';
import 'package:src/widgets/panel.dart';

class DBPanelHeader extends Container {
  String? _title;
  String? _sideText;
  Widget? _sideIcon;

  @override
  DBPanelHeader({String? title, String? sideText, Widget? sideIcon, Key? key})
      : super(key: key) {
    _title = title ?? "Tiêu đề trống";
    _sideText = sideText ?? "Xem chi tiết";
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
                      .bodyText1!
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
