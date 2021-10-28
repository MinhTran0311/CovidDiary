import 'package:flutter/material.dart';
import 'package:src/HealthDiary/health_report.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';

import 'covid_dairy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CovidDiaryPreferences.init();
  runApp(CovidDiary());
}
