import 'dart:async';

import 'package:flutter/material.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/onBoarding/boarding.dart';
import 'package:src/core/onBoarding/login_method_page.dart';
import 'package:src/core/HealthDiary/symptom_detail.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timerSplash;

  void _navigator() {
<<<<<<< HEAD
    // if (this._isLoggedIn) {
    //   pushReplacement(context, HomePage(selectedPage: 1));
    // } else if (this._isViewedOnBoarding) {
    //   pushReplacement(context, ChooseLoginPage());
    // } else {
    //   pushReplacement(context, BoardingScreen());
    // }
    pushReplacement(
        SymptomDetail(
          symptom: 1,
          onDone: (_) {},
          onCanceled: () {},
        ),
        context);
    //pushReplacement(SymptomReport(), context);
=======
    bool isOldUser = CovidDiaryPreferences.getValue<bool>("isOldUser");

    if (!isOldUser)
      pushReplacement(BoardingPage(), context);
    else
      pushReplacement(LoginMethodPage(), context);
>>>>>>> origin/main
  }

  @override
  void initState() {
    super.initState();
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
