import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopio_app/core/utils/app_routes.dart';
import 'package:shopio_app/features/ui/home/home_screen.dart';

import 'core/di/di.dart';
import 'core/utils/my_bloc_observer.dart';
import 'features/ui/auth/sign_in/sign_in_screen.dart';
import 'features/ui/auth/register/register_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  configureDependencies();
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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.signInRoute: (context) => LoginScreen(),
            AppRoutes.registerRoute: (context) => RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
          },
          initialRoute: AppRoutes.signInRoute,
        );
      },
    );
  }
}
