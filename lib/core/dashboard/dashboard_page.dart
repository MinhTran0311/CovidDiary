import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:src/core/dashboard/widget/avatar_widget.dart';
import 'package:src/core/dashboard/widget/health_track_widget.dart';
import 'package:src/core/dashboard/widget/place_track_widget.dart';
import 'package:src/core/dashboard/widget/today_stats_widget.dart';
import 'package:src/widgets/input_field/gradient_background.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  // flutter pub global run intl_utils:generate

  @override
  Widget build(BuildContext context) {
    return GradientBackGround(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              children: [
                DBAvatarWidget(),
                SizedBox(height: 8.h),
                DBTodayStatsWidget(),
                SizedBox(height: 8.h),
                DBHealthTrackWidget(),
                SizedBox(height: 8.h),
                DBPlaceTrackWidget(),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
