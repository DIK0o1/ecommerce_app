import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:e_commerce/ui/home/home_screen/home_screen_view.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        restorationScopeId: "Test",
        // <-- Add this line for windows apps
        initialRoute: HomeScreenView.routeName,
        routes: {
          SplashScreen.routeName: (context) =>  SplashScreen(),
          HomeScreenView.routeName: (context) =>  HomeScreenView(),
          LoginScreen.routeName: (context) =>  LoginScreen(),
          RegisterScreen.routeName: (context) =>  RegisterScreen()
        },
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
