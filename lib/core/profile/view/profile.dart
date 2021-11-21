import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/profile/model/info_model.dart';
import 'package:src/core/profile/view/edit_profitle.dart';
import 'package:src/widgets/input_field/gradient_background.dart';
import 'package:src/widgets/panel.dart';
import 'package:src/widgets/round_avatar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
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
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
            onPressed: () async {
              await navigateTo(EditProfile(), context);
              this.setState(() {});
            },
            icon: SvgPicture.asset('assets/svg/icon/pencil.svg'),
          ),
        ]),
        SizedBox(height: 70.h),
        _buildInfo(context),
        SizedBox(height: 10.h),
        _buildSocialNetwork(context),
        SizedBox(height: 10.h),
        _buildAchievement(context)
      ]),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      child: Stack(children: [
        PanelLight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 64.h),
              Text(
                Info.instance.name.toUpperCase(),
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
              _buildInfoDetail(S.current.profile_info_dob, "15/03/2020"),
              SizedBox(height: 8.h),
              _buildInfoDetail(
                  S.current.email_input, "Sieu nhan cuong @ gmail.com"),
              SizedBox(height: 8.h),
              _buildInfoDetail(S.current.profile_info_phone, "0935723862"),
              SizedBox(height: 8.h),
              _buildInfoDetail(S.current.profile_info_work, "Product Owner"),
            ],
          ),
        ),
        Center(
          child: Container(
            transform: Matrix4.translationValues(0.0, -64.h, 0.0),
            child: RoundAvatar(
              path: Info.instance.avatar,
              isPicked: Info.instance.isPicked,
              width: 128.w,
              height: 128.h,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildInfoDetail(String title, String value) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(title,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: getCustomColor().black)),
          ),
          flex: 1),
      SizedBox(width: 32.w),
      Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(value,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: getCustomColor().black)),
          ),
          flex: 1)
    ]);
  }

  Widget _buildSocialNetwork(BuildContext context) {
    return PanelLight(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          S.current.profile_info_social,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600, color: getCustomColor().secondary),
        ),
        SizedBox(
          height: 10.h,
        ),
        _renderSocialNetwork(context),
      ]),
    );
  }

  Widget _renderSocialNetwork(BuildContext context) {
    return Container(
      height: 40,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.horizontal,
          scrollDirection: Axis.horizontal,
          itemCount: Info.instance.socialArr.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Image(
                image: AssetImage(Info.instance.socialArr[index].imgUrl),
                width: 30,
                height: 30,
              ),
            );
          }),
    );
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
              _buildAwardDetail('assets/image/vacxin1.png', 'Đã tiêm mũi 1'),
              _buildAwardDetail('assets/image/vacxin2.png', "Đã tiêm mũi 2"),
              _buildAwardDetail('assets/image/award.png', "Công dân gương mẫu"),
              _buildAwardDetail('assets/image/lazy.png', "Lười để chống dịch"),
              _buildAwardDetail('assets/image/stayHome.png', "Ở nhà vui khỏe"),
              _buildAwardDetail('assets/image/approved.png',
                  "Thường xuyên cập nhật sức khỏe"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAwardDetail(String url, String name) {
    return InkWell(
      onTap: () {
        showCustomDialog(
            context,
            Material(
              child: Container(
                child: Center(
                  child: PanelLight(
                    width: 280.w,
                    height: 280.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.current.profile_info_achievement,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: getCustomColor().secondary),
                        ),
                        SizedBox(height: 10.h),
                        Image.asset(url, width: 130.w, height: 130.h),
                        SizedBox(height: 20.h),
                        Text(
                          name.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: getCustomColor().primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
      child: Image.asset(url, width: 64.w, height: 64.h),
    );
  }
}
