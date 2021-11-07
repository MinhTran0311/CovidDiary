import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'log_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late int activeTabIndex;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    activeTabIndex = 0;
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _buildAppBar(),
          _buildTabBar(),
          _buildForms(context),
        ]),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 208.h,
      child: Stack(children: [
        Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
          color: getCustomColor().primary,
          image: DecorationImage(
              image: AssetImage("assets/svg/authPage_app_bar.png"),
              fit: BoxFit.fill),
        )),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 24.h, left: 16.h),
              child: SvgPicture.asset('assets/svg/icon/left_arrow.svg'),
            ),
          ),
        )
      ]),
    );
  }

  Widget _buildTabBar() {
    TextStyle _tabLabelStyle = Theme.of(context).textTheme.bodyText1!.copyWith(
        color: getCustomColor().primary,
        fontWeight: FontWeight.w700,
        height: (20 / 16));
    TextStyle _tabUnselectedLabelStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(
            color: getCustomColor().black,
            fontWeight: FontWeight.w700,
            height: (20 / 16));
    return Container(
      margin: EdgeInsets.only(top: 32.h),
      width: 327.w,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: TabBar(
          controller: tabController,
          physics: ClampingScrollPhysics(),
          labelColor: getCustomColor().primary,
          unselectedLabelColor: getCustomColor().black,
          indicatorColor: getCustomColor().primary,
          labelStyle: _tabLabelStyle,
          unselectedLabelStyle: _tabUnselectedLabelStyle,
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.symmetric(horizontal: 10.25.w),
            borderSide: BorderSide(
              width: 4.h,
              color: getCustomColor().primary,
            ),
          ),
          onTap: (index) {
            setState(() {
              activeTabIndex = index;
            });
          },
          tabs: <Widget>[
            Tab(text: S.current.sign_in),
            Tab(text: S.current.sign_up)
          ]),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Expanded(
      child: IndexedStack(
        children: [
          Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              child: LoginPage(callBack: changeTab),
            ),
            maintainState: true,
            visible: activeTabIndex == 0,
          ),
          Visibility(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
              child: Text("sign up"),
            ),
            maintainState: true,
            visible: activeTabIndex == 1,
          )
        ],
        index: activeTabIndex,
      ),
    );
  }

  changeTab(int index) {
    setState(() {
      tabController.animateTo(index);
      activeTabIndex = index;
    });
  }
}
