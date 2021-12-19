import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/custom_colors.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/achievement/model/achievement_model.dart';
import 'package:src/core/achievement/view/personal_achievement.dart';
import 'package:src/core/achievement/widget/category_tab_bar.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/panel.dart';
import 'package:src/widgets/round_avatar.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'dart:math';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

enum SelectedTab { day, week, month }

class _ScoreBoardState extends State<ScoreBoard> {
  late List<PersonalData> listDataDay;
  late List<PersonalData> listDataWeek;
  late List<PersonalData> listDataMonth;

  SelectedTab _selectedTab = SelectedTab.day;
  var name = "Tuan Minh";
  var avatarUrl = "assets/svg/avatar.png";
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

  late PersonalData data;
  late PersonalData personalData;

  @override
  void initState() {
    super.initState();
    data = new PersonalData(name, avatarUrl, awardArr, 7);
    personalData = new PersonalData(
        "Siêu nhân cuồng phong", "assets/svg/avatar.png", awardArr, 2);
    var rng = new Random();

    listDataDay = [];
    listDataWeek = [];
    listDataMonth = [];
    listDataDay.add(PersonalData("Duy Đức", avatarUrl, awardArr, 200));
    listDataWeek.add(PersonalData("Trung Võ", avatarUrl, awardArr, 170));
    listDataMonth.add(PersonalData("Minh Trần", avatarUrl, awardArr, 150));

    for (int i = 0; i < 10; i++) {
      listDataDay
          .add(new PersonalData(name, avatarUrl, awardArr, rng.nextInt(50)));
      listDataWeek
          .add(new PersonalData(name, avatarUrl, awardArr, rng.nextInt(50)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarCustom(
            title: S.current.score_board_app_bar_title, context: context),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _buildTabBar(context),
        SizedBox(height: 8.h),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              _buildTopRanking(context),
              SizedBox(height: 16.h),
              PanelLight(child: _buildScoreBoard(context)),
            ]),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            color: getCustomColor().panelLight,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(8.r),
              splashColor: getCustomColor().gray,
              splashFactory: InkSplash.splashFactory,
              onTap: () => {navigateTo(PersonalAchievement(), context)},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: _buildPersonalTile(
                    data: personalData, isUp: true, rank: 99),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ]),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CategoryTabBar(
          isSelected: _selectedTab == SelectedTab.day,
          title: S.current.score_board_today,
          callBack: () {
            setState(() {
              _selectedTab = SelectedTab.day;
            });
          }),
      CategoryTabBar(
          isSelected: _selectedTab == SelectedTab.week,
          title: S.current.score_board_week,
          callBack: () {
            setState(() {
              _selectedTab = SelectedTab.week;
            });
          }),
      CategoryTabBar(
          isSelected: _selectedTab == SelectedTab.month,
          title: S.current.score_board_month,
          callBack: () {
            setState(() {
              _selectedTab = SelectedTab.month;
            });
          })
    ]);
  }

  Widget _buildTopRanking(BuildContext context) {
    return PanelLight(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildTop3(PersonalData("Trung Võ", avatarUrl, awardArr, 170), 2,
                getCustomColor().primary),
            _buildTop3(PersonalData("Duy Đức", avatarUrl, awardArr, 200), 1,
                getCustomColor().secondary),
            _buildTop3(PersonalData("Minh Trần", avatarUrl, awardArr, 150), 3,
                CustomColors.error),
          ]),
    );
  }

  Widget _buildTop3(PersonalData data, int top, Color color) {
    TextStyle style = Theme.of(context).textTheme.caption!.copyWith(
        color: getCustomColor().secondary, fontWeight: FontWeight.w900);
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      top == 1
          ? Image.asset("assets/image/top_1_ranking.png")
          : SvgPicture.asset(top == 2
              ? "assets/svg/icon/up_ranking.svg"
              : "assets/svg/icon/down_ranking.svg"),
      SizedBox(height: 4.h),
      RoundAvatar(
          borderColor: color,
          path: data.avatarUrl,
          width: top != 1 ? 80.r : null,
          height: top != 1 ? 80.r : null),
      Container(
        transform: Matrix4.translationValues(0.0, -10.h, 0.0),
        height: 20.r,
        width: 20.r,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)), color: color),
        child: Text(
          top.toString(),
          textAlign: TextAlign.center,
          style: style.copyWith(color: getCustomColor().black),
        ),
      ),
      Text(data.name, style: style.copyWith(color: getCustomColor().black)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset("assets/svg/icon/heart.svg",
            width: 10.r, height: 10.r, color: getCustomColor().secondary),
        SizedBox(width: 4.w),
        Text(data.totalPoint.toString(),
            style: style.copyWith(color: getCustomColor().secondary)),
      ])
    ]);
  }

  Widget _buildScoreBoard(BuildContext context) {
    List<PersonalData> listData = _selectedTab == SelectedTab.day
        ? listDataDay
        : _selectedTab == SelectedTab.week
            ? listDataWeek
            : listDataMonth;
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return _buildListTile(
                data: listData[index], isUp: index % 2 == 0, rank: index + 4);
          },
        ),
      ],
    );
  }

  Widget _buildListTile(
      {required PersonalData data, required bool isUp, required int rank}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            width: 20.w,
            child: Text(rank.toString(),
                style: Theme.of(context).textTheme.bodyText1)),
        SizedBox(width: 8.w),
        SvgPicture.asset(isUp
            ? "assets/svg/icon/up_ranking.svg"
            : "assets/svg/icon/down_ranking.svg"),
        SizedBox(width: 8.w),
        RoundAvatar(path: data.avatarUrl, width: 50.r, height: 50.r),
        SizedBox(width: 8.w),
        Text(data.name),
        Expanded(child: Container()),
        SvgPicture.asset("assets/svg/icon/heart.svg",
            width: 10.r, height: 10.r),
        SizedBox(width: 4.w),
        Text(
          data.totalPoint.toString(),
          style: Theme.of(context).textTheme.caption!.copyWith(
              color: getCustomColor().secondary, fontWeight: FontWeight.w900),
        ),
        SizedBox(width: 8.w)
      ]),
    );
  }

  Widget _buildPersonalTile(
      {required PersonalData data, required bool isUp, required int rank}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
            width: 20.w,
            child: Text(rank.toString(),
                style: Theme.of(context).textTheme.bodyText1)),
        SizedBox(width: 8.w),
        SvgPicture.asset(isUp
            ? "assets/svg/icon/up_ranking.svg"
            : "assets/svg/icon/down_ranking.svg"),
        SizedBox(width: 8.w),
        RoundAvatar(path: data.avatarUrl, width: 50.r, height: 50.r),
        SizedBox(width: 8.w),
        Text(
          data.name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: getCustomColor().secondary, fontWeight: FontWeight.w700),
        ),
        Expanded(child: Container()),
        SvgPicture.asset("assets/svg/icon/heart.svg",
            width: 10.r, height: 10.r),
        SizedBox(width: 4.w),
        Text(
          data.totalPoint.toString(),
          style: Theme.of(context).textTheme.caption!.copyWith(
              color: getCustomColor().secondary, fontWeight: FontWeight.w900),
        ),
        SizedBox(width: 8.w)
      ]),
    );
  }
}
