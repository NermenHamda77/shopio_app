import 'package:flutter/material.dart';
import 'package:shopio_app/core/utils/app_colors.dart';
import 'package:shopio_app/core/utils/app_routes.dart';
import 'package:shopio_app/core/utils/app_styles.dart';
import 'package:shopio_app/features/widgets/custom_elevated_button.dart';
import 'package:shopio_app/features/widgets/custom_text_field.dart';

import '../../../core/utils/app_assets.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    AppAssets.shopioLogoImg,
                    fit: BoxFit.fitWidth,
                    width: 250,
                    alignment: AlignmentGeometry.center,
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  "Welcome Back To Shopio",
                  style: AppStyles.semi24White,
                ),
                Text(
                  "Please sign in with your mail",
                  style: AppStyles.light16White,
                ),
                SizedBox(height: 20,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 18,
                    children: [
                      Text(
                        "User Name",
                        style: AppStyles.medium18White,
                      ),
                      CustomTextField(
                        validator: (text) {
                          return null;
                        },
                        controller: usernameController,
                        borderColor: AppColors.transparentColor,
                        hintText: "enter your name",
                        hintStyle: AppStyles.light16HintColor,
                        filled: true,
                        fillColor: AppColors.whiteColor,

                      ),
                      //SizedBox(height: 8,),

                      Text(
                        "Password",
                        style: AppStyles.medium18White,
                      ),
                      CustomTextField(
                        validator: (text) {
                          return null;
                        },
                        controller: usernameController,
                        borderColor: AppColors.transparentColor,
                        hintText: "enter your password",
                        hintStyle: AppStyles.light16HintColor,
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        suffixIcon: IconButton(
                            onPressed: (){
                              hidePassword = !hidePassword;
                              setState(() {

                              });
                            },
                            icon: Icon(
                              hidePassword ?
                              Icons.visibility_off_outlined :
                              Icons.visibility,
                              color: AppColors.hintTextColor,
                            ),
                        ),

                      ),

                      Align(
                        alignment: AlignmentGeometry.centerEnd,
                        child: TextButton(
                          onPressed: (){
                          },
                          child: Text("Forget Password?" ,
                          style: AppStyles.regular18White,
                          textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      CustomElevatedButton(
                          title: Text("Login", style: AppStyles.semi20PrimaryOpacity,),
                          onPressed: (){},
                          backgroundColor: AppColors.whiteColor
                      )

                    ],
                  ),
                ),
                SizedBox(height: 4,),


                Row(
                  //spacing: 5,
                  children: [
                    Expanded(
                      flex: 3,
                        child: Text("Don’t have an account?", style: AppStyles.regular18White,)),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(AppRoutes.registerRoute);
                    }, child: Text("Create Account", style: AppStyles.regular18White,)),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
