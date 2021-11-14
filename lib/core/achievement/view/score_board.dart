import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/achievement/model/achievement_model.dart';
import 'package:src/core/achievement/widget/category_tab_bar.dart';
import 'package:src/widgets/app_bar.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/panel.dart';
import 'package:src/widgets/round_avatar.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  late List<PersonalData> listData;
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

  late PersonalData data;

  @override
  void initState() {
    super.initState();
    data = new PersonalData(name, avatarUrl, awardArr, 7);
    listData = [];
    for (int i = 0; i < 10; i++) {
      listData.add(data);
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
        )
      ]),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      CategoryTabBar(isSelected: true, title: S.current.score_board_today),
      CategoryTabBar(isSelected: false, title: S.current.score_board_week),
      CategoryTabBar(isSelected: false, title: S.current.score_board_month)
    ]);
  }

  Widget _buildTopRanking(BuildContext context) {
    return PanelLight(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildTop3(data, 2, getCustomColor().secondary),
            _buildTop3(data, 1, getCustomColor().secondary),
            _buildTop3(data, 3, getCustomColor().secondary),
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
      Text(data.name, style: style),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset("assets/svg/icon/heart.svg",
            width: 10.r, height: 10.r),
        SizedBox(width: 4.w),
        Text(data.totalPoint.toString(), style: style),
      ])
    ]);
  }

  Widget _buildScoreBoard(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      itemCount: listData.length,
      itemBuilder: (context, index) {
        return _buildListTile(
            data: listData[index], isUp: index % 2 == 0, rank: index + 4);
      },
    );
  }

  Widget _buildListTile(
      {required PersonalData data, required bool isUp, required int rank}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(width: 20.w, child: Text(rank.toString(), style: Theme.of(context).textTheme.bodyText1)),
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
}
