import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class AppBarCustom extends AppBar {
  final bool hasReturnIcon;

  AppBarCustom({
    this.hasReturnIcon = true,
    required BuildContext context,
    required String title,
    List<Widget>? action,
  }) : super(
            title: Text(title,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: getCustomColor().white)),
            leading: hasReturnIcon
                ? IconButton(
                    onPressed: () => goBack(context),
                    icon: SvgPicture.asset('assets/svg/icon/left_arrow.svg'),
                  )
                : null,
            backgroundColor: getCustomColor().primary,
            bottomOpacity: 0.0,
            elevation: 0.0,
            leadingWidth: 50.w,
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: action);
}
