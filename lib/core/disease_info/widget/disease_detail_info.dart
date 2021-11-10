import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';

class DiseaseDetailInfo extends StatelessWidget {
  final Color backGround;
  final String iconPath;
  final String title;
  final double number;
  final Color foreGround;

  const DiseaseDetailInfo(
      {Key? key,
      required this.backGround,
      required this.iconPath,
      required this.title,
      required this.number,
      required this.foreGround})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: backGround),
      width: 100.w,
      height: 100.w,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath),
            SizedBox(height: 4.h),
            Text(
              '${(numberFormat.format(number))}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontWeight: FontWeight.w700, color: foreGround),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w700, color: getCustomColor().black),
            )
          ]),
    );
  }
}

class CasesDetail extends DiseaseDetailInfo {
  CasesDetail({
    double? number,
  }) : super(
            backGround: Color(0xFFF9B9B0),
            iconPath: "assets/svg/icon/cases.svg",
            title: S.current.disease_info_cases,
            number: number ?? 0,
            foreGround: CustomColors.error);
}

class HealedDetail extends DiseaseDetailInfo {
  HealedDetail({
    double? number,
  }) : super(
            backGround: Color(0xFFA4E09B),
            iconPath: "assets/svg/icon/heals.svg",
            title: S.current.disease_info_healed,
            number: number ?? 0,
            foreGround: Color(0xFF559910));
}

class DeathDetail extends DiseaseDetailInfo {
  DeathDetail({
    double? number,
  }) : super(
            backGround: Color(0xFFB2B2B2),
            iconPath: "assets/svg/icon/deaths.svg",
            title: S.current.disease_info_death,
            number: number ?? 0,
            foreGround: getCustomColor().black);
}
