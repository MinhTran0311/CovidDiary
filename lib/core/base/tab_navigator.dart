import 'package:flutter/material.dart';
import 'package:src/core/HealthDiary/health_history.dart';
import 'package:src/core/dashboard/dashboard_page.dart';
import 'package:src/core/achievement/view/personal_achievement.dart';
import 'package:src/core/achievement/view/score_board.dart';
import 'package:src/core/disease_info/view/disease_info.dart';
import 'package:src/core/HealthDiary/health_report.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  //${Preferences.access_token}
  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == "HomeScreen")
      child = HealthHistory();
    else if (tabItem == "MapsScreen")
      child = ScoreBoard();
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
