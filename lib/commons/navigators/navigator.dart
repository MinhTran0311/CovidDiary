import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget widget;

  SlideUpRoute(this.widget)
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeUpwardsPageTransitionsBuilder().buildTransitions(
                  null, context, animation, secondaryAnimation, child),
        );
}

void showCustomDialog(BuildContext context, Widget child) {
  showGeneralDialog(
    barrierLabel: "213",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: Duration(milliseconds: 500),
    context: context,
    pageBuilder: (_, __, ___) {
      return child;
    },
    transitionBuilder: (_, anim, __, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
        child: child,
      );
    },
  );
}

Future navigateTo(Widget screen, BuildContext context) {
  return Navigator.push(context, _getPlatformRoute(context, screen));
}

Future popUp(BuildContext context, Widget screen) {
  return Navigator.push(context, SlideUpRoute(screen));
}

Future pushReplacement(Widget screen, BuildContext context) {
  return Navigator.pushReplacement(context, _getPlatformRoute(context, screen));
}

void goBack<T>(BuildContext context, [T? result]) {
  return Navigator.of(context).pop(result);
}

void popToTop(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}

Future showBottomPage(BuildContext context, Widget screen,
    {bool enableDrag = true, bool expand = false}) {
  return showCupertinoModalBottomSheet(
      expand: expand,
      context: context,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      topRadius: Radius.circular(16.r),
      builder: (builder) => screen);
}

Future showCupertinoPopup(BuildContext context, Widget child,
    {ThemeData? theme}) {
  return showCupertinoModalPopup(
      context: context,
      builder: (context) => Theme(
            data: theme ?? ThemeData.light(),
            child: child,
          ));
}

Future showBottomSheetApiLoading(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blue,
      ),
    ),
  );
}

Route<Object?> _getPlatformRoute(BuildContext context, Widget screen) {
  if (Platform.isIOS) return CupertinoPageRoute(builder: (context) => screen);
  return MaterialPageRoute(builder: (context) => screen);
}
