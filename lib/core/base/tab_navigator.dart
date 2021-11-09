import 'package:flutter/material.dart';
import 'package:src/core/dashboard/dashboard_page.dart';

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
    else if (tabItem == "MapsScreen")
      child = DashboardPage();
    else if (tabItem == "ManagementScreen")
      child = DashboardPage();
    else if (tabItem == "ProfileScreen")
      child = DashboardPage();
    else if (tabItem == "NewPost") child = DashboardPage();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
