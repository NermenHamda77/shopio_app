import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopio_app/core/di/di.dart';
import 'package:shopio_app/features/ui/auth/register/cubit/register_view_model.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../auth_states.dart';


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
  TextEditingController rePasswordController = TextEditingController();
  var registerViewModel = getIt<RegisterViewModel>();
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
    rePasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: registerViewModel,
      listener: (context, state) {
        if(state is AuthLoadingState){
          DialogUtils.showLoading(message: "Waiting...", context: context);
        }else if(state is AuthErrorState){
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            content: Text(state.exception.message),
            context: context,
            icon: Icon(Icons.error_outline , color: Theme.of(context).primaryColor,),
            posActionName: "Ok",
            title: "Error",
          );

        }else if(state is AuthSuccessState){
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            content: Text("Sign Up Successfully"),
            context: context,
            icon: Icon(Icons.done_outline_outlined , color: Theme.of(context).primaryColor,),
            posActionName: "Ok",
            title: "Success",
          );

        }
      },
      child: Scaffold(
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
                            return AppValidators.validateFullName(text);
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
                            return AppValidators.validatePhoneNumber(text);
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
                            return AppValidators.validateEmail(text);
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
                            return AppValidators.validatePassword(text);
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
                        //SizedBox(height: 20.h,),

                        AutoSizeText(
                          "RePassword",
                          maxLines: 1,
                          style: AppStyles.medium18White,
                        ),
                        CustomTextField(
                          validator: (text) {
                            return AppValidators.validateConfirmPassword(text, passwordController.text);
                          },
                          controller: rePasswordController,
                          borderColor: AppColors.transparentColor,
                          hintText: "enter rePassword",
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
                              signUp();
                             //Navigator.of(context).pushNamed(AppRoutes.homeRoute);

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
                        signUp();
                        //Navigator.of(context).pushNamed(AppRoutes.signInRoute);
                      }, child: AutoSizeText(
                          "Sign Up ",
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
      ),
    );
  }

  void signUp() {
    if(formKey.currentState!.validate()){
      registerViewModel.register(
          email: emailController.text,
          password: passwordController.text,
          userName: fullNameController.text,
          rePassword: rePasswordController.text,
          phone: mobileController.text
      );
    }
  }
}
