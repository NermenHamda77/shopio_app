import 'package:flutter/material.dart';
import 'package:shopio_app/core/utils/app_routes.dart';
import 'package:shopio_app/features/ui/home/home_screen.dart';
import 'package:shopio_app/features/ui/login/login_screen.dart';
import 'package:shopio_app/features/ui/register/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.loginRoute : (context) => LoginScreen(),
        AppRoutes.registerRoute : (context) => RegisterScreen(),
        AppRoutes.homeRoute : (context) => HomeScreen(),

      },
      initialRoute: AppRoutes.loginRoute,
    );
  }
}
