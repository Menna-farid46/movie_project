import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_final_project/core/resources/Appstyle.dart';
import 'package:movies_final_project/core/resources/Routes.dart';
import 'package:movies_final_project/ui/Login/screen/login_screen.dart';
import 'package:movies_final_project/ui/StartScreen/screen/startscreen.dart';
import 'package:movies_final_project/ui/home/screen/home_screen.dart';
import 'package:movies_final_project/ui/onboarding/screen/onboarding.dart';
import 'package:movies_final_project/ui/register/screen/register_screen.dart';

import 'core/remote/local/prefsmanager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized(); //vip
  await PrefsManager.init();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      path: "assets/translation",
      startLocale: Locale("en"),
      supportedLocales: [
        Locale("en"),
        Locale("ar")
      ],
      fallbackLocale: Locale("en") ,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          darkTheme: AppStyles.darkTheme,
          initialRoute: RoutesManager.startscreen,
          routes: {
            RoutesManager.startscreen: (_) => Startscreen(),
            RoutesManager.OnboardingScreen:(_)=>OnboardingScreen(),
            RoutesManager.loginscreen:(_)=>LoginScreen(),
            RoutesManager.regiterscreen:(_)=>RegisterScreen(),
            RoutesManager.homescreen:(_)=>HomeScreen(),



          },
        );
      },
    );
  }
}
