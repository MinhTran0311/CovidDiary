import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/commons/l10n/generated/l10n.dart';
import 'package:src/commons/navigators/navigator.dart';
import 'package:src/commons/themes/light_color.dart';
import 'package:src/commons/themes/theme.dart';
import 'package:src/core/auth/view/auth.dart';
import 'package:src/core/dashboard/widget/avatar_widget.dart';
import 'package:src/core/dashboard/widget/health_track_widget.dart';
import 'package:src/core/dashboard/widget/place_track_widget.dart';
import 'package:src/core/dashboard/widget/today_stats_widget%20%20copy.dart';
import 'package:src/core/onBoarding/widget/login_with_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [DBTodayStatsWidget()]),
      ),
    );
  }
}