import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';

class LoadingPage extends StatefulWidget {
  final Widget nextPage;

  const LoadingPage({Key? key, required this.nextPage}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Timer _timerSplash;
  late Random rng;

  List<String> images = [
    'assets/gif/onBoarding1.gif',
    'assets/gif/onBoarding2.gif',
    'assets/gif/onBoarding3.gif',
    'assets/gif/onBoarding4.gif'
  ];
  List<String> text = [
    S.current.on_boarding1,
    S.current.on_boarding2,
    S.current.on_boarding3,
    S.current.on_boarding4
  ];

  void _navigator() {
   pushReplacement(widget.nextPage, context);
  }

  @override
  void initState() {
    super.initState();
    rng = new Random();
    _timerSplash = Timer(Duration(seconds: 2), _navigator);
  }

  @override
  void dispose() {
    _timerSplash.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    int index = rng.nextInt(3);
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 288.h),
          height: 128,
          width: 128,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(images[index]), fit: BoxFit.fill),
          ),
        ),
        SizedBox(height: 32.h),
        Align(
          alignment: FractionalOffset.center,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              text[index],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w700, color: getCustomColor().primary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 48.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 64,
                  width: 128,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage("assets/logo/IWN1.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
