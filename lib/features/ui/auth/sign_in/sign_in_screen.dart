import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopio_app/core/di/di.dart';
import 'package:shopio_app/core/utils/app_colors.dart';
import 'package:shopio_app/core/utils/app_routes.dart';
import 'package:shopio_app/core/utils/app_styles.dart';
import 'package:shopio_app/core/utils/dialog_utils.dart';
import 'package:shopio_app/core/utils/validators.dart';
import 'package:shopio_app/features/ui/auth/auth_states.dart';
import 'package:shopio_app/features/widgets/custom_elevated_button.dart';
import 'package:shopio_app/features/widgets/custom_text_field.dart';

import '../../../../core/utils/app_assets.dart';
import 'cubit/sign_in_view_model.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  SignInViewModel loginViewModel = getIt<SignInViewModel>();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: loginViewModel,
      listener: (context, state) {
        if(state is AuthLoadingState){
          DialogUtils.showLoading(message: "Loading...", context: context);
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
              content: Text("Login Successfully"),
              context: context,
              icon: Icon(Icons.done_outline_outlined , color: Theme.of(context).primaryColor,),
              posActionName: "Ok",
              title: "Success",
          );
          
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
               // spacing: 5,
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
                  SizedBox(height: 30.h,),
                  AutoSizeText(
                    "Welcome Back To Shopio",
                    maxLines: 1,
                    style: AppStyles.semi24White,
                  ),
                  AutoSizeText(
                    "Please sign in with your mail",
                    maxLines: 1,
                    style: AppStyles.light16White,
                  ),
                  SizedBox(height: 20.h,),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 16.h,
                      children: [
                        AutoSizeText(
                          "Email",
                          maxLines: 1,
                          style: AppStyles.medium18White,
                        ),
                        CustomTextField(
                          validator: (text) {
                            return AppValidators.validateEmail(text);
                          },
                          controller: emailController,
                          borderColor: AppColors.transparentColor,
                          hintText: "enter your email",
                          hintStyle: AppStyles.light16HintColor,
                          filled: true,
                          fillColor: AppColors.whiteColor,
      
                        ),
                        //SizedBox(height: 8,),
      
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
                                setState(() {});
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
                            child: AutoSizeText("Forget Password?" ,
                            style: AppStyles.regular18White,
                            textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        CustomElevatedButton(
                            title: Text("Login", style: AppStyles.semi20PrimaryOpacity,),
                            onPressed: (){
                              login();
                            },
                            backgroundColor: AppColors.whiteColor
                        )
      
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h,),
      
      
                  Row(
                    //spacing: 5,
                    children: [
                      Expanded(
                        flex: 3,
                        child: AutoSizeText(
                          "Don’t have an account?",
                          maxLines: 1,
                          style: AppStyles.regular18White,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: TextButton(onPressed: (){
                          Navigator.of(context).pushNamed(AppRoutes.registerRoute);
                        }, child: AutoSizeText(
                            "Create Account",
                            style: AppStyles.regular18White.copyWith(
                            color: AppColors.babyBlueColor
                        ),
                          maxLines: 1,
                        )
                        ),
                      ),
      
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

  void login() {
    if(formKey.currentState!.validate()){
      loginViewModel.signIn(
          email: emailController.text,
          password: passwordController.text
      );
    }
  }
}
