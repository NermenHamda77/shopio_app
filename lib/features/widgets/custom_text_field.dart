import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

typedef OnChanged = void Function(String)?;
typedef OnValidator = String? Function(String?)?;
class CustomTextField extends StatelessWidget {
  Color borderColor;
  bool? filled;
  Color? fillColor;
  String hintText;
  TextStyle hintStyle;
  Widget? suffixIcon;
  Widget? prefixIcon;
  int? maxLines;
  OnChanged? onChanged;
  OnValidator? validator;
  TextEditingController? controller;
  TextInputType keyboardType;
  bool obscureText;

  CustomTextField({
    super.key,
    required this.borderColor,
    required this.hintText,
    required this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.fillColor,
    this.filled,
    this.maxLines,
    this.onChanged,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.keyboardType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(borderColor: borderColor),
        focusedBorder: buildOutlineInputBorder(borderColor: borderColor),
        errorBorder: buildOutlineInputBorder(borderColor: AppColors.redColor),
        focusedErrorBorder: buildOutlineInputBorder(borderColor: AppColors.redColor),
        hintText: hintText,
        hintStyle: hintStyle,
        filled: filled,
        fillColor: fillColor,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }
}
