import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:src/commons/themes/theme.dart';
import 'curved_navi_bar.dart';
import 'tab_navigator.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String _currentPage = "HomeScreen";
  int _currentIndex = 0;
  late PageController _pageController;
  int _selectedIndex = 0;

  List<String> pageKeys = [
    "HomeScreen",
    "MapsScreen",
    "NewPost",
    "ProfileScreen",
    "ManagementScreen"
  ];
  Map<String, GlobalKey<NavigatorState>> _navigatorKeys = {
    "HomeScreen": GlobalKey<NavigatorState>(),
    "MapsScreen": GlobalKey<NavigatorState>(),
    "ManagementScreen": GlobalKey<NavigatorState>(),
    "ProfileScreen": GlobalKey<NavigatorState>(),
    "NewPost": GlobalKey<NavigatorState>(),
  };

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
            !await _navigatorKeys[_currentPage]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          if (_currentPage != "HomeScreen") {
            _selectTab("HomeScreen", 1);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: [
          _buildOffstageNavigator("HomeScreen"),
          _buildOffstageNavigator("MapsScreen"),
          _buildOffstageNavigator("NewPost"),
          _buildOffstageNavigator("ProfileScreen"),
          _buildOffstageNavigator("ManagementScreen"),
        ]),
        ///TO DO - Trung Vo
        bottomNavigationBar: CustomCurvedNavigationBar(
          height: 60,
          backgroundColor: getCustomColor().background,
          color: getCustomColor().primary,
          items: <Widget>[
            // Icons.account_box, Icons.home, Icons.menu
            Icon(Icons.home_rounded, size: 30, color: Colors.black),
            Icon(Icons.location_pin, size: 30, color: Colors.black),
            Icon(Icons.add_circle_rounded, size: 30, color: Colors.black),
            Icon(Icons.person, size: 30, color: Colors.black),
            Icon(Icons.admin_panel_settings_rounded,
                size: 30, color: Colors.black),
          ],
          index: _currentIndex,
          onTap: (index) {
            setState(
              () {
                _selectTab(pageKeys[index], index);
                _currentIndex = index;
              },
            );
            //_pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }

  void _selectTab(String tabItem, int index) {
    if (tabItem == _currentPage) {
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentPage = pageKeys[index];
        // _selectedIndex = index;
      });
    }
  }

  Widget _buildOffstageNavigator(String tabItem) {
    return Offstage(
      offstage: _currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
