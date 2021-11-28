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
import 'package:src/widgets/input_field/text_form_field.dart';

class MovementReport extends StatefulWidget {
  const MovementReport({Key? key}) : super(key: key);

  _MovementReportState createState() => _MovementReportState();
}

class Location {
  Location(
    String? visitPlace,
    this.visitTimes,
    this.coordX,
    this.coordY,
  ) {
    if (visitPlace == null)
      this.visitPlace = defaultLocationName(coordX, coordY);
    else
      this.visitPlace = visitPlace;
  }

  static String defaultLocationName(double coordX, double coordY) {
    return coordX.toStringAsFixed(2) + ", " + coordY.toStringAsFixed(2);
  }

  String getDefaultLocationName() {
    return coordX.toStringAsFixed(2) + ", " + coordY.toStringAsFixed(2);
  }

  late String visitPlace;
  final int visitTimes;
  final double coordX;
  final double coordY;
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

  String bottomQuestionNewLoc =
      "Bạn có muốn đặt nickname\ncho vị trí này không?";
  String bottomQuestionOldLoc = "Bạn đã chọn vị trí này?";
  String selectedLocationStr = "Bạn đã chọn:";
  String selectedNicknameStr = "Nickname:";
  String cancelButtonStr = "Huỷ lưu";
  String confirmNoNicknameButtonStr = "Không nickname";
  String confirmButtonStr = "Xác nhận";

  List<Location> visitPlaces = [
    Location("Nhà Simmy", 21, -123, 12),
    Location("Net IMBA", 18, 234, -46),
    Location("Kho", 17, -92, 102),
    Location("Chợ gần nhà", 15, -293, -392),
    Location("Bách hóa xanh", 5, 499, 122),
    Location("Ngân hàng", 2, 39, -222),
    Location("Công ty", 1, 12, -11)
  ];

  String? searchQuery;
  Location? currentLocation;

  TextEditingController searchController = new TextEditingController();
  PhotoViewController photoController = new PhotoViewController();
  TextEditingController nicknameController = new TextEditingController();

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
            currentLocation == null
                ? buildBottomSearch()
                : buildBottomConfirm(currentLocation!.visitPlace ==
                        currentLocation!.getDefaultLocationName()
                    ? null
                    : currentLocation!.visitPlace),
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
          minScale: PhotoViewComputedScale.contained * minScale,
          maxScale: PhotoViewComputedScale.contained * maxScale,
          basePosition: Alignment.center,
          initialScale: PhotoViewComputedScale.contained * 4,
          controller: photoController,
          //*
          backgroundDecoration: BoxDecoration(
            color: getCustomColor().background,
          ),
          disableGestures: currentLocation != null,
          enablePanAlways: false,
          tightMode: true,
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
                      controller: searchController,
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

  Widget buildBottomConfirm(String? initialName) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: getCustomColor().panelLight,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.r,
              blurRadius: 1.5.r,
              offset: Offset(0, -3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    initialName == null
                        ? bottomQuestionNewLoc
                        : bottomQuestionOldLoc,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: getCustomColor().primary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedLocationStr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: getCustomColor().black),
                  ),
                  Text(
                    Location.defaultLocationName(photoController.position.dx,
                        photoController.position.dy),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: getCustomColor().black),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  Text(
                    selectedNicknameStr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: getCustomColor().black),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormFieldWidget(
                      context: context,
                      controller: nicknameController,
                      hintText: currentLocation!.visitPlace,
                      hasLabel: false,
                    ),
                  ),
                ],
              ),
            ),
            buildBottomConfirmButtons(initialName == null),
          ],
        ),
      ),
    );
  }

  Widget buildBottomConfirmButtons(bool noNameAvailable) {
    List<Widget> rowChild = [
      Expanded(
        child: FillButton(
          onPressed: onCancel,
          buttonColor: CustomColors.error,
          buttonText: cancelButtonStr,
        ),
        flex: 3,
      ),
      Spacer(),
    ];

    if (noNameAvailable) {
      rowChild.add(Expanded(
        child: FillButton(
          onPressed: onSaveNoNickname,
          buttonColor: CustomColors.warning,
          buttonText: confirmNoNicknameButtonStr,
        ),
        flex: 3,
      ));
      rowChild.add(Spacer());
    }
    rowChild.add(Expanded(
      child: FillButton(
        onPressed: onSaveWithNickname,
        buttonColor: CustomColors.success,
        buttonText: confirmButtonStr,
      ),
      flex: 3,
    ));

    return Container(
      padding: EdgeInsets.all(8.r),
      child: Row(
        children: rowChild,
      ),
    );
  }

  Widget buildSearchResult() {
    List<Widget> places = [];
    for (int i = 0; i < visitPlaces.length; i++)
      if (searchQuery == null ||
          visitPlaces[i].visitPlace.contains(searchQuery!))
        places.add(
          PlaceTrackItemWidget(
            place: visitPlaces[i].visitPlace,
            timeVisit: visitPlaces[i].visitTimes,
            onPress: () => setState(() {
              searchController.text = searchQuery = visitPlaces[i].visitPlace;
              photoController.position =
                  new Offset(visitPlaces[i].coordX, visitPlaces[i].coordY);
            }),
          ),
        );

    return searchQuery == null
        ? Container()
        : Expanded(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8.w,
              runSpacing: 8.h,
              children: places,
            ),
            flex: 0,
          );
  }

  void onSearch() {
    setState(() {
      {
        if (searchController.text == "")
          searchQuery = null;
        else
          searchQuery = searchController.text;
      }
    });
  }

  void onSelect() {
    Location? result;
    Location thisLocation = new Location(
      null,
      1,
      photoController.position.dx,
      photoController.position.dy,
    );
    for (int i = 0; i < visitPlaces.length; i++)
      if (thisLocation.coordX == visitPlaces[i].coordX &&
          thisLocation.coordY == visitPlaces[i].coordY) {
        result = visitPlaces[i];
      }
    if (result == null) result = thisLocation;
    setState(() {
      currentLocation = result;
    });
  }

  void onCancel() {
    setState(() {
      currentLocation = null;
    });
    // TODO
  }

  void onSaveNoNickname() {
    setState(() {
      currentLocation = null;
    });
    // TODO
  }

  void onSaveWithNickname() {
    setState(() {
      currentLocation = null;
    });
    // TODO
  }
}
