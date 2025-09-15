import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_final_project/core/resources/Appstyle.dart';
import 'package:movies_final_project/core/resources/Routes.dart';
import 'package:movies_final_project/ui/Login/screen/login_screen.dart';
import 'package:movies_final_project/ui/StartScreen/screen/startscreen.dart';
import 'package:movies_final_project/ui/onboarding/screen/onboarding.dart';

void main() {
  runApp(const MyApp());
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
          debugShowCheckedModeBanner: false,
          darkTheme: AppStyles.darkTheme,
          initialRoute: RoutesManager.startscreen,
          routes: {
            RoutesManager.startscreen: (_) => Startscreen(),
            RoutesManager.OnboardingScreen:(_)=>OnboardingScreen(),
            RoutesManager.loginscreen:(_)=>LoginScreen()
          },
        );
      },
    );
  }
}
