import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/light_color.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/auth/login/login.dart';

import 'widget/login_with_button.dart';

class LoginMethodPage extends StatelessWidget {
  const LoginMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 56.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/svg/big_icon_with_name_1.png"),
                ),
              ),
              SizedBox(height: 8.h),
            ]),
          ),
          _buildBottomPage(context)
        ]),
      ),
    );
  }
}

Widget _buildBottomPage(BuildContext context) {
  return SafeArea(
    top: false,
    child: Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Column(children: [
        _btnLoginWithPhone(context),
        SizedBox(height: 16.h),
        _buildAppleOrGoogle(context)
      ]),
    ),
  );
}

Widget _buildAppleOrGoogle(BuildContext context) {
  if (Platform.isIOS) return _btnLoginWithApple(context);
  return _btnLoginWithGoogle(context);
}

Widget _btnLoginWithApple(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 32.w),
    child: LoginWithButton(
      buttonColor: Colors.black,
      buttonText: Text(
        S.current.login_with_appleID,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      height: 44.h,
      onPressed: () {
      },
      icon: SvgPicture.asset("assets/svg/icon/apple_logo.svg", width: 18.w),
    ),
  );
}

Widget _btnLoginWithGoogle(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 32.w),
    child: LoginWithButton(
      buttonColor: Color(0xFF4285F4),
      buttonText: Text(
        S.current.login_with_google,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      height: 44.h,
      onPressed: () {
      },
      isGoogleDark: true,
      icon: SvgPicture.asset("assets/svg/icon/google_logo.svg",
          width: 18.w, height: 18.h),
    ),
  );
}

Widget _btnLoginWithPhone(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 32.w),
    child: LoginWithButton(
      buttonColor: getCustomColor().primary,
      buttonText: Text(
        S.current.login_with_phone,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
      ),
      height: 44.h,
      onPressed: () {
        navigateTo(LoginPage(), context);
        // navigateTo(AuthPage(), context);
      },
      icon: SvgPicture.asset(
        "assets/svg/icon/phone_signin.svg",
        color: lightColor.white
      ),
    ),
  );
}
