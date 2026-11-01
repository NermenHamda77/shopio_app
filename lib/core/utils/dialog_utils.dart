import 'package:flutter/material.dart';
import 'package:shopio_app/core/utils/app_colors.dart';

import '../../features/widgets/custom_elevated_button.dart';
import 'app_styles.dart';

class DialogUtils{
  static void showLoading({required String message ,
    required BuildContext context,}){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
        //  var appTheme = Provider.of<AppThemeProvider>(context);
          return AlertDialog(
            content: Row(
              spacing: 20,
              children: [
                CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
                Text(message ,
                  style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),
            backgroundColor: AppColors.blueColor
            /* appTheme.isDarkMode()
                ? AppColors.darkBlueColor
                : AppColors.whiteColor,*/
          );
        }
    );
  }

  static void hideLoading({required BuildContext context}){
    Navigator.pop(context);
  }


  static void showMessage({
    String title = "",
    required Widget content,
    required BuildContext context,
    required Icon icon,
    String? posActionName,
    Future<void> Function()? posAction,
    String? negActionName,
    VoidCallback? negAction,

  }){

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context){
          List<Widget> actions = [];
          if(posActionName != null){
            actions.add(
                CustomElevatedButton(
                  title: Text(posActionName , /*style: AppStyles.medium20White*/),
                  onPressed: () {
                    Navigator.pop(context);
                    posAction?.call();
                  },
                  backgroundColor: Theme.of(context).primaryColor,

                )
            );
          }
          if(negActionName != null){
            actions.add(
                CustomElevatedButton(
                  title:  Text(negActionName ,
                      /*style: AppStyles.medium20White*/),
                  onPressed: () {
                    Navigator.pop(context);
                    negAction?.call();
                  },
                  backgroundColor: AppColors.hintTextColor,
                )
            );
          }
          final theme = Theme.of(context);
          return AlertDialog(
            content: content,
            title: Text(title , style: theme.dialogTheme.titleTextStyle,),
            icon: icon,
            actions: actions,
          );
        }
    );

  }
}