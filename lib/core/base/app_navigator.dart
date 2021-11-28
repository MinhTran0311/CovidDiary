import 'package:flutter/material.dart';

class AppNavigator{
  AppNavigator._();

  static AppNavigator? instance;

  factory AppNavigator() {
    if (instance == null) instance = AppNavigator._();

    return instance!;
  }

  static Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "HomeScreen": GlobalKey<NavigatorState>(),
    "InfoScreen": GlobalKey<NavigatorState>(),
    "ProfileScreen": GlobalKey<NavigatorState>(),
  };
  static List<String> pageKeys = [
    "HomeScreen",
    "InfoScreen",
    "ProfileScreen",
  ];
  static String currentPage = "HomeScreen";
  static int currentIndex = 0;
  static void changeTab(int index){
      currentPage = pageKeys[index];
      currentIndex = index;
  }
}