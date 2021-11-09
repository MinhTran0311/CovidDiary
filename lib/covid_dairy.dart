import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'commons/l10n/generated/l10n.dart';
import 'commons/l10n/l10n.dart';
import 'commons/provider/locale_provider.dart';
import 'commons/themes/theme.dart';
import 'core/splash/splash_page.dart';

class CovidDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      builder: () {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<LocaleProvider>(
                create: (_) => LocaleProvider()),
            ChangeNotifierProvider<ThemeManager>(
                create: (_) => ThemeManager(ThemeManager.lightTheme)),
          ],
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Covid Diary',
              supportedLocales: L10n.all,
              locale: Provider.of<LocaleProvider>(context).locale,
              theme: Provider.of<ThemeManager>(context).themeData,
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: SplashPage(),
            );
          },
        );
      },
    );
  }
}