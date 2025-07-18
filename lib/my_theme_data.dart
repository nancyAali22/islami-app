import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appcolors.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          toolbarHeight: 80.0,
          iconTheme: IconThemeData(color: AppColors.gold)),
      primaryColor: AppColors.gold,
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: AppColors.black,
        selectedItemColor: AppColors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
      textTheme: TextTheme(
        titleLarge: GoogleFonts.elMessiri(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
        titleMedium: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        titleSmall: GoogleFonts.elMessiri(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ));
}
