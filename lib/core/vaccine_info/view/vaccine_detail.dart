import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/vaccine_info/model/vaccine.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/panel.dart';

class VaccineDetailPage extends StatefulWidget {
  final Vaccine vaccine;

  const VaccineDetailPage({Key? key, required this.vaccine}) : super(key: key);

  @override
  _VaccineDetailPageState createState() => _VaccineDetailPageState();
}

class _VaccineDetailPageState extends State<VaccineDetailPage> {
  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        appBar:
            AppBarCustom(title: S.current.vaccine_info_title, context: context),
        backgroundColor: Colors.transparent,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.vaccine.name,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: getCustomColor().white,
                ),
          ),
          SizedBox(height: 16.h),
          Row(children: [
            Text(
              S.current.vaccine_info_made_in,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: getCustomColor().white, fontWeight: FontWeight.w700),
            ),
            SizedBox(width: 40.w),
            Wrap(
              children: renderFlag(context, widget.vaccine.country),
            )
          ]),
          SizedBox(height: 8.h),
          _buildInfo(
              "assets/svg/icon/shield.svg",
              S.current.vaccine_info_effect,
              widget.vaccine.effect.toString() + "%"),
          _buildInfo(
              "assets/svg/icon/world.svg",
              S.current.vaccine_info_nation_used,
              widget.vaccine.numberOfCountries.toString()),
          _buildInfo("assets/svg/icon/dose.svg", S.current.vaccine_info_dose,
              widget.vaccine.doses.toString()),
          _buildInfo("assets/svg/icon/money.svg", S.current.vaccine_info_price,
              widget.vaccine.price.toString() + "\$"),
          SizedBox(height: 8.h),
          Text(
            S.current.vaccine_info_detail,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: getCustomColor().white, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8.h),
          PanelLight(
            child: Text(widget.vaccine.detail,
                style: Theme.of(context).textTheme.bodyText1),
          )
        ]),
      ),
    );
  }

  List<Widget> renderFlag(BuildContext context, List<Country> countryList) {
    List<Widget> list = [];
    countryList.forEach((country) {
      list.add(new Image.asset(
        country.imgUrl!,
        width: 50.w,
        height: 25.h,
      ));
    });
    return list;
  }

  Widget _buildInfo(String assetPath, String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      child: PanelLight(
        height: 54.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SvgPicture.asset(assetPath),
            SizedBox(width: 24.w),
            Text(title, style: Theme.of(context).textTheme.bodyText1),
            Expanded(child: Container()),
            Text(
              value,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.w700),
            )
          ]),
        ),
      ),
    );
  }
}
