import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:src/commons/preference/covid_diary_preferences.dart';

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

// class TestPage extends StatefulWidget {
//   const TestPage({Key? key}) : super(key: key);
//
//   @override
//   _TestPageState createState() => _TestPageState();
// }
//
// class _TestPageState extends State<TestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MainPage()),
//               );
//             },
//             child: Text(
//               "change",
//             )),
//       ),
//     );
//   }
// }
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   _MainPageState createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Column(
//             children: [
//               Text(S.current.confirm_cancel),
//               SizedBox(
//                 height: 48,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   final provider =
//                       Provider.of<LocaleProvider>(context, listen: false);
//                   provider.setLocale(Locale("vi"));
//                 },
//                 child: Text("123123"),
//               ),
//               SizedBox(
//                 height: 48,
//               ),
//               ElevatedButton(
//                   onPressed: () async {
//                     Provider.of<ThemeManager>(context, listen: false)
//                         .themeData = ThemeManager.darkTheme;
//                     CovidDiaryPreferences.setValue("isDarkTheme", true);
//                     this.setState(() {});
//                     print(CovidDiaryPreferences.getValue<bool>("isDarkTheme")
//                         .toString());
//                   },
//                   child: Text(
//                     "CovidDiaryPreferences.getValue(isDarkTheme).toString()",
//                     style: TextStyle(color: Theme.of(context).primaryColor),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//   ChangeNotifierProvider<LocaleProvider>(
//   create: (context) => LocaleProvider(),
//   builder: (context, child) {
//     final provider = Provider.of<LocaleProvider>(context);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Covid Diary',
//       supportedLocales: L10n.all,
//       locale: provider.locale,
//       //theme: getThemeData(),
//       localizationsDelegates: [
//         S.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       home: MainPage(),
//     );
//   },
// );
