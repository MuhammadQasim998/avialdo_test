import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/src/styles/app_colors.dart';

class TextStyling {
  TextStyling._();

  static TextStyle extraLargeRegular = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 26,
    color: AppColors.black,
  );
  static TextStyle largeBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 20, color: AppColors.black);

  static TextStyle largeRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 20, color: AppColors.black);

  static TextStyle mediumBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.black);

  static TextStyle mediumRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.black);

  static TextStyle smallBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 12, color: AppColors.black);

  static TextStyle smallRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.black);

  static TextStyle extraSmallBold = GoogleFonts.poppins(
      fontWeight: FontWeight.w600, fontSize: 8, color: AppColors.black);
  static TextStyle extraSmallRegular = GoogleFonts.poppins(
      fontWeight: FontWeight.w400, fontSize: 8, color: AppColors.black);
}
