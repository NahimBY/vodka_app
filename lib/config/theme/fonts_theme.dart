import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vodka_app/config/theme/colors_theme.dart';

class AppFonts {
  static TextTheme textTheme = GoogleFonts.montserratTextTheme();

  ///////////////////////////////////////////////////////////
  ///                   HEADLINE BOLD                     ///
  ///////////////////////////////////////////////////////////

  static TextStyle headlineBold24 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );

  static TextStyle headlineBold20 = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );

  static TextStyle headlineBold18 = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );

  static TextStyle headlineBold16 = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );

  static TextStyle headlineBold15 = GoogleFonts.montserrat(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );

  static TextStyle headlineBold14 = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );

  ///////////////////////////////////////////////////////////
  ///                 HEADLINE SEMIBOLD                   ///
  ///////////////////////////////////////////////////////////

  static TextStyle headlineSemibold24 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.customBlack,
  );

  ///////////////////////////////////////////////////////////
  ///                  BODYTEXT MEDIUM                    ///
  ///////////////////////////////////////////////////////////

  static TextStyle bodytextMedium24 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: AppColors.customBlack,
  );

  ///////////////////////////////////////////////////////////
  ///                  BODYTEXT REGULAR                   ///
  ///////////////////////////////////////////////////////////

  static TextStyle bodytextRegular24 = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: AppColors.customBlack,
  );

  ///////////////////////////////////////////////////////////
  ///                   APPBAR TITLE                      ///
  ///////////////////////////////////////////////////////////

  static TextStyle appBarTitle = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.customBlack,
  );
}
