import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:vector_math/vector_math_64.dart' as Math;

class Location {
  Location(String? visitPlace, this.visitTimes, this.coordX, this.coordY,
      this.lastVisited) {
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
    this.zoomFactor = 1,
  }) : super(key: key);

  static String iconPin = "assets/svg/icon/location.svg";
  DateFormat get dateFormat => DateFormat("HH:mm, dd/MM");

  final Location location;
  final Color? color;
  final double zoomFactor;

  @override
  Widget build(BuildContext context) {
    double textSize =
        Theme.of(context).textTheme.headline4!.fontSize! / zoomFactor;
    return Positioned(
      right: location.coordX / zoomFactor,
      left: -location.coordX / zoomFactor,
      top: -location.coordY / zoomFactor,
      bottom: location.coordY / zoomFactor,
      child: Center(
        child: SizedOverflowBox(
          size: Size(0, 0),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: color ?? getCustomColor().primary,
                  borderRadius:
                      BorderRadius.all(Radius.circular(32.r / zoomFactor)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.r / zoomFactor,
                      blurRadius: 1.5.r / zoomFactor,
                      offset: Offset(
                          0, -3 / zoomFactor), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8.r / zoomFactor),
                width: 224.w / zoomFactor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      dateFormat.format(location.lastVisited),
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: getCustomColor().white,
                            fontSize: textSize,
                          ),
                    ),
                    Divider(
                      color: getCustomColor().white,
                      height: 1.h / zoomFactor,
                      thickness: 1.h / zoomFactor,
                    ),
                    Text(
                      location.visitPlace,
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: getCustomColor().white,
                            fontSize: textSize,
                          ),
                    )
                  ],
                ),
              ),
              Center(
                child: SvgPicture.asset(
                  iconPin,
                  width: 32.h / zoomFactor,
                  height: 32.h / zoomFactor,
                  fit: BoxFit.fill,
                  color: color ?? getCustomColor().primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
