import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/dashboard/widget/place_track_item_widget.dart';
import 'package:src/core/movement_diary/widget/map_token.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/button/fill_button.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/input_field/text_form_field.dart';

class MovementReport extends StatefulWidget {
  const MovementReport({Key? key}) : super(key: key);

  _MovementReportState createState() => _MovementReportState();
}

class _MovementReportState extends State<MovementReport> {
  String title = S.current.report_title;

  static String mapPicture = "assets/image/HCM_map.png";
  static String iconPin = "assets/svg/icon/location.svg";
  static String iconSearch = "assets/svg/icon/search.svg";

  static const double maxScale = 16;
  static const double minScale = 4;
  double zoom = 8;

  String topQuestion = S.current.movement_report_topQuestion;
  String searchHint = S.current.movement_report_searchHint;

  String bottomQuestionNewLoc = S.current.movement_report_bottomQuestionNewLoc;
  String bottomQuestionOldLoc = S.current.movement_report_bottomQuestionOldLoc;
  String selectedLocationStr = S.current.movement_report_selectedLocationStr;
  String selectedNicknameStr = S.current.movement_report_selectedNicknameStr;
  String cancelButtonStr = S.current.movement_report_cancelButtonStr;
  String confirmButtonStr = S.current.movement_report_confirmButtonStr;
  String searchButton = S.current.movement_report_search;
  String selectButton = S.current.select;

  List<Location> visitPlaces = [
    Location("Nhà Simmy", 21, -34, 3, DateTime.now()),
    Location("Net IMBA", 18, 58, -11, DateTime.now()),
    Location("Kho", 17, -22, 26, DateTime.now()),
    Location("Chợ gần nhà", 15, -74, -98, DateTime.now()),
    Location("Bách hóa xanh", 5, 125, 32, DateTime.now()),
    Location("Ngân hàng", 2, 9, -55, DateTime.now()),
    Location("Công ty", 1, 3, -3, DateTime.now()),
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
    PhotoView photo = PhotoView.customChild(
      //key: ObjectKey(initialZoom),
      child: Container(
        key: ObjectKey(zoom),
        child: map(),
      ),
      minScale: PhotoViewComputedScale.contained * minScale,
      maxScale: PhotoViewComputedScale.contained * maxScale,
      basePosition: Alignment.center,
      initialScale: PhotoViewComputedScale.contained * zoom,
      onScaleEnd: (_, __, ___) => setState(() {
        zoom = photoController.scale ?? zoom;
      }),
      scaleStateChangedCallback: (_) => setState(() {
        zoom = photoController.scale ?? zoom;
      }),
      //*
      controller: photoController,
      backgroundDecoration: BoxDecoration(
        color: getCustomColor().background,
      ),
      //disableGestures: currentLocation != null,
      enablePanAlways: false,
      tightMode: true,
      // */
    );

    return Container(
      padding: EdgeInsets.only(top: 8.h),
      child: ClipRect(child: photo),
    );
  }

  Widget buildCenterPin() {
    return Center(
      child: SizedOverflowBox(
        size: Size(0, 8.h), // For some reason, we need this offset
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          iconPin,
          width: 32.h,
          height: 32.h,
          fit: BoxFit.fill,
          color: getCustomColor().secondary,
        ),
      ),
    );
  }

  Widget map() {
    List<Widget> mapComponent = [
      Image.asset(
        mapPicture,
        fit: BoxFit.contain,
      ),
    ];
    //*
    for (int i = 0; i < visitPlaces.length; i++)
      mapComponent.add(MapToken(
        location: visitPlaces[i],
        zoomFactor: photoController.scale ?? zoom,
      ));

    if (currentLocation != null)
      mapComponent.add(MapToken(
        location: currentLocation!,
        color: getCustomColor().secondary,
        zoomFactor: photoController.scale ?? zoom,
      ));
    // */
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: mapComponent,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 0, 8.r, 0),
              child: Material(
                child: TextFormFieldWidget(
                  context: context,
                  hasLabel: false,
                  hintText: searchHint,
                  controller: searchController,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        iconSearch,
                        width: 32.h,
                        height: 32.h,
                        fit: BoxFit.fill,
                        color: getCustomColor().primary,
                      ),
                      onTap: onSearch,
                    ),
                  ),
                  onChanged: (text) => setState(() => onSearch()),
                ),
              ),
            ),
          ),
          FillButton(
            onPressed: searchQuery != null ? onSearchSelect : onSelect,
            buttonText: searchQuery != null ? searchButton : selectButton,
            buttonColor: searchQuery != null
                ? getCustomColor().primary
                : CustomColors.success,
          )
        ],
      ),
    );
  }

  Widget buildBottomConfirm(BuildContext context, String? initialName) {
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
                    Location.defaultLocationName(
                      photoController.position.dx /
                          (photoController.scale ?? zoom),
                      photoController.position.dy /
                          (photoController.scale ?? zoom),
                    ),
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
                    child: Material(
                      child: TextFormFieldWidget(
                        context: context,
                        controller: nicknameController,
                        hintText: currentLocation!.visitPlace,
                        hasLabel: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            buildBottomConfirmButtons(context, initialName == null),
          ],
        ),
      ),
    );
  }

  Widget buildBottomConfirmButtons(BuildContext context, bool noNameAvailable) {
    List<Widget> rowChild = [
      Expanded(
        child: FillButton(
          onPressed: () => onCancel(context),
          buttonColor: CustomColors.error,
          buttonText: cancelButtonStr,
        ),
        flex: 3,
      ),
      Spacer(),
    ];

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

  void Function()? firstSearchChoice;

  Widget buildSearchResult() {
    List<Widget> places = [];
    firstSearchChoice = null;
    for (int i = 0; i < visitPlaces.length; i++)
      if (searchQuery == null ||
          visitPlaces[i].visitPlace.contains(searchQuery!)) {
        void Function() function = () => setState(() {
              searchController.text = "";
              searchQuery = null;
              photoController.position = Offset(
                visitPlaces[i].coordX,
                visitPlaces[i].coordY,
              ).scale(
                photoController.scale ?? zoom,
                photoController.scale ?? zoom,
              );
            });
        places.add(
          PlaceTrackItemWidget(
            borderColor: getCustomColor().primary,
            place: visitPlaces[i].visitPlace,
            timeVisit: visitPlaces[i].visitTimes,
            onPress: function,
          ),
        );
        if (firstSearchChoice == null) firstSearchChoice = function;
      }

    return searchQuery == null
        ? Container()
        : Expanded(
            child: Container(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 8.w,
                runSpacing: 8.h,
                children: places,
              ),
              padding: EdgeInsets.all(8.r),
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

  void onSearchSelect() {
    firstSearchChoice?.call();
  }

  void onSelect() {
    Location? result;
    Location thisLocation = new Location(
      null,
      1,
      photoController.position.dx / (photoController.scale ?? zoom),
      photoController.position.dy / (photoController.scale ?? zoom),
      DateTime.now(),
    );
    for (int i = 0; i < visitPlaces.length; i++)
      if (thisLocation.coordX == visitPlaces[i].coordX &&
          thisLocation.coordY == visitPlaces[i].coordY) {
        result = visitPlaces[i];
      }
    if (result == null) result = thisLocation;
    setState(() {
      currentLocation = result;
      showCustomDialog(
          context,
          buildBottomConfirm(
              context,
              currentLocation!.visitPlace ==
                      currentLocation!.getDefaultLocationName()
                  ? null
                  : currentLocation!.visitPlace));
    });
  }

  void onCancel(BuildContext context) {
    setState(() {
      currentLocation = null;
    });
    goBack(Scaffold.of(context).context);
    // TODO
  }

  void onSaveNoNickname() {
    setState(() {
      currentLocation = null;
    });
    goBack(Scaffold.of(context).context);
    popToTop(context);
    // TODO
  }

  void onSaveWithNickname() {
    setState(() {
      currentLocation = null;
    });
    goBack(Scaffold.of(context).context);
    popToTop(context);
    // TODO
  }
}
