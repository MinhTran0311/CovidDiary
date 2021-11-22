import 'package:flutter/material.dart';
import 'package:src/core/dashboard/dashboard_page.dart';
import 'package:src/core/disease_info/view/disease_info.dart';
import 'package:src/core/profile/view/profile.dart';
import 'package:src/core/vaccine_info/view/vaccine_board.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  //${Preferences.access_token}
  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == "HomeScreen")
      child = DashboardPage();
    else if (tabItem == "InfoScreen")
      child = VaccineBoard();
    else if (tabItem == "ProfileScreen") child = Profile();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
