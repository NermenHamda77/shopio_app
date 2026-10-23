import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  Widget child;
  Color backgroundColor;
  Color borderColor;
  double radius;
  EdgeInsetsGeometry? padding;
   CustomContainer({
     super.key ,
     required this.child,
     required this.backgroundColor,
     required this.borderColor,
     this.radius = 16,
     this.padding
   });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  //  var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: padding ?? EdgeInsets.all(width*0.03),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
            color: borderColor,
            width: 2
        ),
      ),
      child: child,
    );
  }
}
