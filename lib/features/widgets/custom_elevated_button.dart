import 'package:flutter/material.dart';


class CustomElevatedButton extends StatelessWidget {
  Color backgroundColor;
  Widget title;
  VoidCallback onPressed;
  EdgeInsetsGeometry? padding;
  CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    this.padding
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: padding ?? EdgeInsets.symmetric(vertical: height * 0.015 ,
            horizontal: width*0.02),
        backgroundColor: backgroundColor
      ),
      onPressed:onPressed,
      child: title,
    );
  }
}
