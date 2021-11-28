import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/base/app_navigator.dart';
import 'curved_navi_bar.dart';
import 'tab_navigator.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  //String _currentPage = "HomeScreen";
  //int _currentIndex = 0;
  late PageController _pageController;
  int _selectedIndex = 0;




  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await AppNavigator.navigatorKeys[AppNavigator.currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (AppNavigator.currentPage != "HomeScreen") {
            _selectTab("HomeScreen", 0);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: [
          _buildOffstageNavigator("HomeScreen"),
          _buildOffstageNavigator("InfoScreen"),
          _buildOffstageNavigator("ProfileScreen"),
        ]),
        bottomNavigationBar: CustomCurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          color: getCustomColor().primary,
          items: <Widget>[
            // Icons.account_box, Icons.home, Icons.menu
            Icon(Icons.home_rounded,
                size: 32, color: getCustomColor().background),
            Icon(Icons.location_pin,
                size: 32, color: getCustomColor().background),
            Icon(Icons.account_circle,
                size: 32, color: getCustomColor().background),
          ],
          index: AppNavigator.currentIndex,
          onTap: (index) {
            setState(
              () {
                _selectTab(AppNavigator.pageKeys[index], index);
                AppNavigator.currentIndex = index;
              },
            );
            //_pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }

  void _selectTab(String tabItem, int index) {
    if (tabItem == AppNavigator.currentPage) {
      AppNavigator.navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        AppNavigator.currentPage = AppNavigator.pageKeys[index];
        AppNavigator.currentIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: AppNavigator.currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: AppNavigator.navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
