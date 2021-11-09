import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';

class AppBarCustom extends AppBar {
  AppBarCustom({
    required BuildContext context,
    required String title,
  }) : super(
            title: Text(title),
            leading: IconButton(
              onPressed: () => goBack(context),
              icon: SvgPicture.asset('assets/svg/icon/left_arrow.svg'),
            ),
            backgroundColor: getCustomColor().primary,
            bottomOpacity: 0.0,
            elevation: 0.0,
            leadingWidth: 50.w,
            centerTitle: true,
            automaticallyImplyLeading: false);
}
