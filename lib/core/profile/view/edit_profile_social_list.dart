import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/profile/model/info_model.dart';

List<Social> socialArr = [
  Social("Facebook", 'assets/image/facebook.png', "Hoàng tử sa mạt"),
  Social("Tinder", 'assets/image/tinder.png', "Hoàng Tuấn Minh"),
  Social("Twitter", 'assets/image/twitter.png', "t.me/desert.eagle"),
  Social("Github", 'assets/image/github.png', "Hoàng tử sa mạt"),
  Social("Google", 'assets/image/google.png', "Hoàng Tuấn Minh"),
  Social("LinkedIn", 'assets/image/linkedin.png', "t.me/desert.eagle"),
  Social("Telegram", 'assets/image/telegram.png', "Hoàng Tuấn Minh"),
];

List<Widget> socialNetworkList(BuildContext context) {
  List<Widget> list = [];
  socialArr.forEach((element) {
    list.add(InkWell(
      onTap: () {
        if (!checkName(element.name)) {
          Info.instance.socialArr.add(element);
        } else {
          Info.instance.socialArr
              .removeWhere((info) => info.name == element.name);
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 3.w),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: checkName(element.name)
                ? getCustomColor().primary
                : getCustomColor().panelMedium,
            borderRadius: BorderRadius.circular(8.r)),
        width: 170.w,
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              element.imgUrl,
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              element.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.w600, color: getCustomColor().black),
            ),
          ],
        ),
      ),
    ));
  });
  return list;
}

bool checkName(String name) {
  for (int i = 0; i < Info.instance.socialArr.length; i++) {
    if (name == Info.instance.socialArr[i].name) return true;
  }
  return false;
}
