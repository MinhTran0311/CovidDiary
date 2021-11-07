import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/HealthDiary/health_report.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/onBoarding/login_method_page.dart';
import 'package:src/HealthDiary/symptom_detail.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timerSplash;

  bool _isViewedOnBoarding = false;
  bool _isLoggedIn = false;

  void _loadPrefs() {
    // Map<String, dynamic> _settings = _session.userSettings;
    // _isViewedOnBoarding = _settings['isFirstTime'] ?? false;
    // if (!_isViewedOnBoarding) {
    //   _settings['isFirstTime'] = true;
    //   _session.userSettings = _settings;
    // }
    // _isLoggedIn = _session.isLogged;
  }

  void _navigator() {
    // if (this._isLoggedIn) {
    //   pushReplacement(context, HomePage(selectedPage: 1));
    // } else if (this._isViewedOnBoarding) {
    //   pushReplacement(context, ChooseLoginPage());
    // } else {
    //   pushReplacement(context, BoardingScreen());
    // }
    pushReplacement(SymptomDetail(symptom: 1, onSliderChange: (_) {}), context);
    //pushReplacement(SymptomReport(), context);
  }

  @override
  void initState() {
    super.initState();
    _loadPrefs();
    _timerSplash = Timer(Duration(milliseconds: 3000), _navigator);
  }

  @override
  void dispose() {
    _timerSplash.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getCustomColor().primary,
      body: Align(
        alignment: Alignment.center,
        child: Image.asset("assets/svg/icon_with_name_2.png"),
      ),
    );
  }
}
