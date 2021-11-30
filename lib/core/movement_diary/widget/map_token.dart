import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:vector_math/vector_math_64.dart' as Math;

class Location {
  Location(
    String? visitPlace,
    this.visitTimes,
    this.coordX,
    this.coordY,
    this.lastVisited,
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
  final DateTime lastVisited;
}

class MapToken extends StatelessWidget {
  MapToken({
    Key? key,
    required this.location,
    this.color,
  }) : super(key: key);

  static String iconPin = "assets/svg/icon/location.svg";
  DateFormat get dateFormat => DateFormat("HH:mm, dd/MM");

  final Location location;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: location.coordX,
      left: -location.coordX,
      top: -location.coordY,
      bottom: location.coordY,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color ?? getCustomColor().primary,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(32.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.r,
                  blurRadius: 1.5.r,
                  offset: Offset(0, -3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  dateFormat.format(location.lastVisited),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: getCustomColor().white),
                ),
                Container(
                  height: 1.h,
                  color: getCustomColor().white,
                ),
                Text(
                  location.visitPlace,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: getCustomColor().white),
                )
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset(
              iconPin,
              width: 16.h,
              height: 16.h,
              fit: BoxFit.fill,
              color: color ?? getCustomColor().primary,
            ),
          ),
        ],
      ),
    );
  }
}
