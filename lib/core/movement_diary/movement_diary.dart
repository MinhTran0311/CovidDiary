import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/l10n/l10n.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:expandable/expandable.dart';
import 'package:src/core/dashboard/widget/place_track_item_widget.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/border_button.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

class MovementReport extends StatefulWidget {
  const MovementReport({Key? key}) : super(key: key);

  _MovementReportState createState() => _MovementReportState();
}

class _MovementReportState extends State<MovementReport> {
  String title = S.current.report_title;

  static String mapPicture = "assets/image/HCM_map.png";
  static String iconPin = "assets/svg/icon/heart.svg";
  static String iconSearch = "assets/svg/icon/vietnam.svg";

  static const double maxScale = 8;
  static const double minScale = 2;

  String topQuestion = "Bạn mới đi đâu về thế?";
  String searchHint = "Nhập để tìm kiếm";

  TextEditingController controller = new TextEditingController();

  List<String> id = [];

  String? searchQuery = null;

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(context: context, title: title), //app bar
        body: Stack(
          children: [
            buildMap(),
            buildTopQuestion(),
            buildCenterPin(),
            buildBottomSearch(),
          ],
          textDirection: TextDirection.ltr,
        ),
      ),
    );
  }

  Widget buildTopQuestion() {
    return Container(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            topQuestion,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: getCustomColor().white),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: getCustomColor().primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
      ),
      alignment: Alignment.center,
    );
  }

  Widget buildMap() {
    return Container(
      padding: EdgeInsets.only(top: 8.h),
      child: ClipRect(
        child: PhotoView.customChild(
          child: Container(
            child: map(),
          ),
          minScale: PhotoViewComputedScale.covered * minScale,
          maxScale: PhotoViewComputedScale.covered * maxScale,
          basePosition: Alignment.center,
          initialScale: PhotoViewComputedScale.covered * 4,
          //*
          backgroundDecoration: BoxDecoration(
            color: getCustomColor().background,
          ),
          // */
        ),
      ),
    );
  }

  Widget buildCenterPin() {
    return Center(
      child: SvgPicture.asset(
        iconPin,
        width: 16.h,
        height: 16.h,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget map() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          mapPicture,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget buildBottomSearch() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildSearchResult(),
          buildBottomSearchBar(),
        ],
      ),
    );
  }

  Widget buildBottomSearchBar() {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.r,
            blurRadius: 1.5.r,
            offset: Offset(0, -3), // changes position of shadow
          ),
        ],
        color: getCustomColor().panelLight,
      ),
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  GestureDetector(
                    child: SvgPicture.asset(
                      iconSearch,
                      width: 32.h,
                      height: 32.h,
                      fit: BoxFit.fill,
                    ),
                    onTap: onSearch,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.overline,
                        hintText: searchHint,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FillButton(
            onPressed: onSelect,
            buttonText: S.current.select,
            buttonColor: CustomColors.success,
          )
        ],
      ),
    );
  }

  Widget? buildBottomConfirm() {
    // TODO
    return null;
  }

  Widget? buildBottomConfirmName() {
    // TODO
    return null;
  }

  Widget buildSearchResult() {
    return searchQuery == null
        ? Container()
        : Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                PlaceTrackItemWidget(place: "Nhà Simmy", timeVisit: 21),
                PlaceTrackItemWidget(place: "Net IMBA", timeVisit: 18),
                PlaceTrackItemWidget(place: "Ngân hàng", timeVisit: 2),
              ],
            ),
            flex: 0,
          );
  }

  void onSearch() {
    setState(() {
      {
        if (controller.text == "")
          searchQuery = null;
        else
          searchQuery = controller.text;
      }
    });
  }

  void onSelect() {
    // TODO
  }

  void onCancel() {
    // TODO
  }

  void onSaveNoNickname() {
    // TODO
  }

  void onSaveWithNickname() {
    // TODO
  }
}
