import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/profile/model/info_model.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/panel.dart';
import 'package:src/widgets/round_avatar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Info userInfo;

  @override
  void initState() {
    super.initState();
    userInfo = new Info("Siêu nhân cuồng phong", "15/3/2000",
        "sieunhancuongphong@gmail.com", 0123456789, "Product Owner");
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: _buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        //App bar
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset('assets/svg/icon/pencil.svg'),
            ),
          ],
        ),
        SizedBox(height: 80.h),
        _buildInfo(context),
        SizedBox(height: 10.h),
        _builSocialNetwork(context),
        SizedBox(height: 10.h),
        _buildAchievement(context)
      ]),
    );
  }

  Widget _buildInfo(BuildContext context) {
    double lineHeight = 45.h;
    return PanelLight(
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            transform: Matrix4.translationValues(0.0, -64.h, 0.0),
            child: RoundAvatar(
              path: "assets/svg/avatar.png",
              width: 128.w,
              height: 128.h,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            transform: Matrix4.translationValues(0.0, -64.h, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  userInfo.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: getCustomColor().primary),
                ),
                SizedBox(height: 10.h),
                //Info Tittle
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.current.profile_info_title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: getCustomColor().secondary),
                    ),
                  ],
                ),
                //Info Detail
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                S.current.profile_info_dob,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Email",
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                S.current.profile_info_phone,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                S.current.profile_info_work,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.h),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userInfo.dob,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userInfo.email,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userInfo.phone.toString(),
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                          Container(
                            height: lineHeight,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                userInfo.work,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: getCustomColor().black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _builSocialNetwork(BuildContext context) {
    return PanelLight(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.current.profile_info_social,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: getCustomColor().secondary),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          // This next line does the trick.
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image(
              image: AssetImage('assets/image/facebook.png'),
            ),
            Image(
              image: AssetImage('assets/image/tinder.png'),
            ),
            Image(
              image: AssetImage('assets/image/telegram.png'),
            ),
            Image(
              image: AssetImage('assets/image/linkedin.png'),
            ),
            Image(
              image: AssetImage('assets/image/twitter.png'),
            ),
          ],
        )
      ],
    ));
  }

  Widget _buildAchievement(BuildContext context) {
    return PanelLight(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                S.current.profile_info_achievement,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: getCustomColor().secondary),
              ),
            ],
          ),
          Wrap(
            runSpacing: 20.w,
            spacing: 20.h,
            children: [
              Image(
                image: AssetImage('assets/image/vacxin1.png'),
                width: 64.w,
                height: 64.h,
              ),
              Image(
                image: AssetImage('assets/image/vacxin2.png'),
                width: 64.w,
                height: 64.h,
              ),
              Image(
                image: AssetImage('assets/image/award.png'),
                width: 64.w,
                height: 64.h,
              ),
              Image(
                image: AssetImage('assets/image/lazy.png'),
                width: 64.w,
                height: 64.h,
              ),
              Image(
                image: AssetImage('assets/image/stayHome.png'),
                width: 64.w,
                height: 64.h,
              ),
              Image(
                image: AssetImage('assets/image/approved.png'),
                width: 64.w,
                height: 64.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
