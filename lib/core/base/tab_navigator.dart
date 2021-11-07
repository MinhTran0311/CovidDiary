import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});

  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  //${Preferences.access_token}
  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (tabItem == "HomeScreen")
      child = Container();
    else if (tabItem == "MapsScreen")
      child = Container();
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
