import 'package:flutter/material.dart';
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
      child = EmotionReport();
    else if (tabItem == "MapsScreen")
      child = ScoreBoard();
    else if (tabItem == "ManagementScreen")
      child = Container();
    else if (tabItem == "ProfileScreen")
      child = Container();
    else if (tabItem == "NewPost") child = Container();
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (context) => child);
      },
    );
  }
}
