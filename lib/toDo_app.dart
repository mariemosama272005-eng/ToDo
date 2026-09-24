import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/feature/home/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/feature/login/login_screen.dart';
import 'package:to_do_app/feature/login/splash/splash_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(420, 821),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
        home:SplashScreen()));
  }
}