import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/themes/theme.dart';

import 'login_method_page.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  late final int _numPages;
  late final PageController _pageController;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _numPages = 5;
    _pageController = PageController(initialPage: 0);
  }

  ///Build list các indicator của page view
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages - 1; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  ///Build style cho các indicator
  Widget _indicator(bool isActive) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
        height: 8.w,
        width: 8.w,
        decoration: BoxDecoration(
          color: isActive ? getCustomColor().primary : getCustomColor().gray,
          borderRadius: BorderRadius.all(
            Radius.circular(50.r),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: _buildPagesOfOnBoardings(context),
        ),
      ),
    );
  }

  ///Build danh sách các trang của page view
  Stack _buildPagesOfOnBoardings(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        ///Page OnBoarding
        child: PageView(
            physics: ClampingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              _buildDetailPageView(
                  'assets/gif/onBoarding1.gif', S.current.on_boarding1),
              _buildDetailPageView(
                  'assets/gif/onBoarding2.gif', S.current.on_boarding2),
              _buildDetailPageView(
                  'assets/gif/onBoarding3.gif', S.current.on_boarding3),
              _buildDetailPageView(
                  'assets/gif/onBoarding4.gif', S.current.on_boarding4),
              LoginMethodPage()
            ]),
      ),
      _currentPage == _numPages - 1
          ? SizedBox.shrink()
          : Padding(
            padding: EdgeInsets.only(bottom: 48.h),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 64,
                width: 128,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage("assets/logo/IWN1.png"),
                      fit: BoxFit.fill),
                ),
              ),
            ),
          ),
      Align(
        alignment: FractionalOffset.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _currentPage == _numPages - 1 ? [] : _buildPageIndicator(),
        ),
      )
    ]);
  }

  ///Build content của mỗi pageview
  Column _buildDetailPageView(String pathImage, String content) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 288.h),
        height: 128,
        width: 128,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image:
              DecorationImage(image: AssetImage(pathImage), fit: BoxFit.fill),
        ),
      ),
      SizedBox(height: 32.h),
      Align(
        alignment: FractionalOffset.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            content,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w700, color: getCustomColor().primary),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ]);
  }
}
