import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:photo_view/photo_view.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/disease_info/widget/disease_detail_info.dart';
import 'package:src/core/disease_info/widget/statistical_table.dart';
import 'package:src/core/disease_info/widget/tab_bar.dart';
import 'package:src/widgets/app_bar.dart';

class DiseaseInfoPage extends StatefulWidget {
  const DiseaseInfoPage({Key? key}) : super(key: key);

  @override
  _DiseaseInfoPageState createState() => _DiseaseInfoPageState();
}

class _DiseaseInfoPageState extends State<DiseaseInfoPage> {
  late int selectedIndex;
  late bool isExpanding;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    isExpanding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: S.current.disease_info_app_bar_title,
        context: context,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Flexible(child: _buildStatistic(), ),
        isExpanding ? SizedBox.shrink() : Expanded(child: _buildMap(), flex: 2,)
      ],
    );
  }

  Widget _buildStatistic() {
    Jiffy.locale();
    return Padding(
      padding: EdgeInsets.only(bottom: isExpanding ? 32.h : 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
            color: getCustomColor().background,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(Jiffy().yMMMMEEEEd),
            SizedBox(height: 8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              RoundTabBar(
                  title: S.current.disease_info_vietnam,
                  isSelected: selectedIndex == 0,
                  iconPath: 'assets/svg/vietnam.png',
                  callBack: () {
                    this.setState(() {
                      selectedIndex = 0;
                    });
                  }),
              RoundTabBar(
                  title: S.current.disease_info_world,
                  isSelected: selectedIndex == 1,
                  iconPath: 'assets/svg/world.png',
                  callBack: () {
                    this.setState(() {
                      selectedIndex = 1;
                    });
                  })
            ]),
            SizedBox(height: 8.h),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CasesDetail(number: 123123),
              HealedDetail(number: 664938),
              DeathDetail(number: 19601)
            ]),
            SizedBox(height: 8.h),
            isExpanding
                ? Expanded(
                    child: StatisticalTable(isVietnam: selectedIndex == 0))
                : SizedBox.shrink(),
            GestureDetector(
              onTap: () {
                this.setState(() {
                  isExpanding = !isExpanding;
                });
              },
              child: Container(
                height: 30.h,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(isExpanding
                      ? "assets/svg/icon/up_arrow.svg"
                      : "assets/svg/icon/down_arrow.svg"),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildMap() {
    return Container(
      padding: EdgeInsets.only(top: 8.h),
      child: ClipRect(
        child: PhotoView.customChild(
          child: Container(
            child: Image.asset(selectedIndex == 0
                ? "assets/image/vietnam_map.png"
                : "assets/image/world_map.png"),
          ),
          minScale: PhotoViewComputedScale.contained * 1,
          maxScale:
              PhotoViewComputedScale.contained * (selectedIndex == 0 ? 2 : 4),
          basePosition: Alignment.center,
          initialScale: PhotoViewComputedScale.contained * 1,
          backgroundDecoration: BoxDecoration(
            color: getCustomColor().background,
          ),
        ),
      ),
    );
  }
}
