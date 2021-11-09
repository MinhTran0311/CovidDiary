import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/widgets/rounded_avatar.dart';

class PersonalAchievement extends StatefulWidget {
  const PersonalAchievement({Key? key}) : super(key: key);

  @override
  _PersonalAchievementState createState() => _PersonalAchievementState();
}

class personalData {
  String name;
  String avatarUrl;
  List<awardDetail> awardArr;

  int getTotalPoints() {
    int totalPoint = 0;
    for (var award in awardArr) {
      if (award.isDone == true) totalPoint += award.point;
    }
    return totalPoint;
  }

  void setTotalPoint(number) {
    this.totalPoint = number;
  }

  int totalPoint;
  personalData(this.name, this.avatarUrl, this.awardArr, this.totalPoint);
}

class awardDetail {
  String name;
  String imageUrl;
  int point;
  bool isDone;
  awardDetail(this.name, this.imageUrl, this.point, this.isDone);
}

var name = "Tuan Minh";
var avatarUrl = "assets/image/anh_ban_a.png";
var awardArr = [
  new awardDetail("Da tiem mui 1", "assets/image/vacxin1.png", 3, true),
  new awardDetail("Da tiem mui 2", "assets/image/vacxin2.png", 4, true),
  new awardDetail("Luoi de chong dich", "assets/image/lazy.png", 3, false),
  new awardDetail("Da co nguoi yeu", "assets/image/award.png", 3, false),
  new awardDetail("Da tiem mui 1", "assets/image/vacxin1.png", 3, true),
  new awardDetail("Da tiem mui 2", "assets/image/vacxin2.png", 4, true),
  new awardDetail("Luoi de chong dich", "assets/image/lazy.png", 3, false),
  new awardDetail("Da co nguoi yeu", "assets/image/award.png", 3, false),
  new awardDetail("Da tiem mui 1", "assets/image/vacxin1.png", 3, true),
  new awardDetail("Da tiem mui 2", "assets/image/vacxin2.png", 4, true),
  new awardDetail("Luoi de chong dich", "assets/image/lazy.png", 3, false),
  new awardDetail("Da co nguoi yeu", "assets/image/award.png", 3, false),
  new awardDetail("Da tiem mui 1", "assets/image/vacxin1.png", 3, true),
  new awardDetail("Da tiem mui 2", "assets/image/vacxin2.png", 4, true),
  new awardDetail("Luoi de chong dich", "assets/image/lazy.png", 3, false),
  new awardDetail("Da co nguoi yeu", "assets/image/award.png", 3, false),
];

personalData data = new personalData(name, avatarUrl, awardArr, 7);

class _PersonalAchievementState extends State<PersonalAchievement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            getCustomColor().primary,
            getCustomColor().primary,
            getCustomColor().white
          ])),
      child: Scaffold(
          appBar: AppBarCustom(title: "Huy hiệu", context: context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PanelLight(
                      child: Column(children: <Widget>[
                        RoundAvatar(path: data.avatarUrl),
                        SizedBox(width: 15),
                        Text(name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: getCustomColor().black),
                            textAlign: TextAlign.center),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              'assets/svg/icon/heart.svg',
                              color: getCustomColor().secondary,
                              width: 28.w,
                              height: 28.h,
                            ),
                            SizedBox(width: 5),
                            Text(
                              data.totalPoint.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: getCustomColor().secondary),
                            ),
                          ],
                        )
                      ]),
                    ),
                    SizedBox(height: 16.h),
                    buildList(data.awardArr),
                  ]),
            ),
          ),
          backgroundColor: Colors.transparent),
    );
  }

  ///Avatar người dùng
  Widget buildAvatar(url) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: getCustomColor().secondary, width: 4.w),
        //color: getCustomColor().ưhi,
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.contain),
      ),
    );
  }

  ///Build icon camera
  Widget buildIconCamera() {
    return Container(
      // margin: EdgeInsets.only(top: 5.h),
      //padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
      transform: Matrix4.translationValues(0.0, -12.h, 0.0),
      height: 24.r,
      width: 24.r,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: getCustomColor().secondary),
      child: Text("1", textAlign: TextAlign.center),
    );
  }

  Widget buildList(List<awardDetail> awardArr) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: awardArr.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: PanelLight(
            height: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                  image: AssetImage(awardArr[index].imageUrl),
                  width: 50.w,
                  height: 50.h,
                ),
                Container(
                  width: 180.w,
                  child: Text(
                    awardArr[index].name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: getCustomColor().black),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  "+" + awardArr[index].point.toString(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: awardArr[index].isDone == true
                          ? getCustomColor().secondary
                          : getCustomColor().gray),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
