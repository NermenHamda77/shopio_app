import 'package:flutter/material.dart';

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

                SizedBox(height: 20,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 18,
                    children: [
                      Text(
                        "Full Name",
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

                      Text(
                        "Mobile Number",
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
                      Text(
                        "E-mail address",
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


                      Text(
                        "Password",
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
                      SizedBox(height: 20,),


                      CustomElevatedButton(
                          title: Text("Sign Up", style: AppStyles.semi20PrimaryOpacity,),
                          onPressed: (){},
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
                    Text("Already have an account?", style: AppStyles.regular18White,),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushNamed(AppRoutes.registerRoute);
                    }, child: Text("Login", style: AppStyles.regular18White),),

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
