import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vodka_app/config/theme/colors_theme.dart';
import 'package:vodka_app/config/theme/fonts_theme.dart';

export 'package:vodka_app/config/theme/colors_theme.dart';
export 'package:vodka_app/config/theme/fonts_theme.dart';

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor < AppColors.palette.length,
        'Colors must be between 0 and ${AppColors.palette.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: AppColors.palette[selectedColor],
      brightness: Brightness.light,
      textTheme: GoogleFonts.montserratTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        titleTextStyle: AppFonts.appBarTitle,
        iconTheme: const IconThemeData(color: AppColors.customBlack, size: 26),
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        shape: const Border(bottom: BorderSide(color: Colors.black12)),
      ),
      iconTheme: const IconThemeData(color: AppColors.customBlack, size: 25),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStatePropertyAll(
          const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
