
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static final TextStyle semi24White = GoogleFonts.poppins(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.whiteColor,
  );

  static final TextStyle light16White = GoogleFonts.poppins(

    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: AppColors.whiteColor,
  );
  static final TextStyle medium18White = GoogleFonts.poppins(

    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColors.whiteColor,
  );
  static final TextStyle light16HintColor = GoogleFonts.poppins(

    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: AppColors.hintTextColor,
  );

  static final TextStyle regular18White = GoogleFonts.poppins(

    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: AppColors.whiteColor,
  );

  static final TextStyle semi20PrimaryOpacity = GoogleFonts.poppins(

    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: AppColors.primaryColor,
  );


  // hint search
  static final TextStyle light14PrimaryDarkLight = GoogleFonts.poppins(

    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: AppColors.primaryDarkLightColor,
  );

  // main category
  static final TextStyle medium18PrimaryDark = GoogleFonts.poppins(

    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: AppColors.primaryDarkColor,
  );

  // sub category
  static final TextStyle regular14PrimaryDark = GoogleFonts.poppins(

    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.primaryDarkColor,
  );

  // view all
  static final TextStyle regular12PrimaryDark = GoogleFonts.poppins(

    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.primaryDarkColor,
  );
}

/*
/// Thin, the least thick.
  static const FontWeight w100 = FontWeight(100);

  /// Extra-light.
  static const FontWeight w200 = FontWeight(200);

  /// Light.
  static const FontWeight w300 = FontWeight(300);

  /// Normal / regular / plain.
  static const FontWeight w400 = FontWeight(400);

  /// Medium.
  static const FontWeight w500 = FontWeight(500);

  /// Semi-bold.
  static const FontWeight w600 = FontWeight(600);

  /// Bold.
  static const FontWeight w700 = FontWeight(700);

  /// Extra-bold.
  static const FontWeight w800 = FontWeight(800);

  /// Black, the most thick.
  static const FontWeight w900 = FontWeight(900);

  /// The default font weight.
  static const FontWeight normal = w400;

  /// A commonly used font weight that is heavier than normal.
  static const FontWeight bold = w700;

 */