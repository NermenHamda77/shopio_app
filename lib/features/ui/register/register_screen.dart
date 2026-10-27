import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),

            child: Column(
              //spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: 40.h , horizontal: 97.w
                  ),
                  child: Image.asset(
                    AppAssets.shopioLogoImg,
                    fit: BoxFit.fitWidth,
                    width: 250.w,
                    alignment: AlignmentGeometry.center,
                  ),
                ),
               // SizedBox(height: 30.h,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 18.h,
                    children: [
                      AutoSizeText(
                        "Full Name",
                        maxLines: 1,
                        style: AppStyles.medium18White,
                      ),
                      CustomTextField(
                        validator: (text) {
                          return null;
                        },
                        controller: fullNameController,
                        borderColor: AppColors.transparentColor,
                        hintText: "enter your full name",
                        hintStyle: AppStyles.light16HintColor,
                        filled: true,
                        fillColor: AppColors.whiteColor,

                      ),

                      AutoSizeText(
                        "Mobile Number",
                        maxLines: 1,
                        style: AppStyles.medium18White,
                      ),
                      CustomTextField(
                        validator: (text) {
                          return null;
                        },
                        controller: mobileController,
                        borderColor: AppColors.transparentColor,
                        hintText: "enter your mobile no.",
                        hintStyle: AppStyles.light16HintColor,
                        filled: true,
                        fillColor: AppColors.whiteColor,

                      ),
                      //SizedBox(height: 8,),
                      AutoSizeText(
                        "E-mail address",
                        maxLines: 1,
                        style: AppStyles.medium18White,
                      ),
                      CustomTextField(
                        validator: (text) {
                          return null;
                        },
                        controller: emailController,
                        borderColor: AppColors.transparentColor,
                        hintText: "enter your email address",
                        hintStyle: AppStyles.light16HintColor,
                        filled: true,
                        fillColor: AppColors.whiteColor,

                      ),


                      AutoSizeText(
                        "Password",
                        maxLines: 1,
                        style: AppStyles.medium18White,
                      ),
                      CustomTextField(
                        validator: (text) {
                          return null;
                        },
                        controller: passwordController,
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
                      SizedBox(height: 20.h,),


                      CustomElevatedButton(
                          title: AutoSizeText(
                            "Sign Up",
                            maxLines: 1,
                            style: AppStyles.semi20PrimaryOpacity,),
                          onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.homeRoute);

                          },
                          backgroundColor: AppColors.whiteColor
                      )

                    ],
                  ),
                ),
                //SizedBox(height: 4,),


                Row(
                  //spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Already have an account?",
                      maxLines: 1,
                      style: AppStyles.regular18White,),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(AppRoutes.loginRoute);
                    }, child: AutoSizeText(
                        "Login ",
                        maxLines: 1,
                        style: AppStyles.regular18White.copyWith(
                      color: AppColors.babyBlueColor
                    )),),

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
