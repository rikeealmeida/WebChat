import 'package:flutter/material.dart';
import 'package:weellu_web/app/constants/colors.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    onSecondary: Colors.white,
  ),

  // backgroundColor: Colors.white,
  // scaffoldBackgroundColor: Colors.white,
  // primaryColor: Colors.green,
  // primarySwatch: Colors.green,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: AppColors.mainColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w700,
      height: 1.9,
      color: AppColors.titleColor,
      fontSize: 22,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: (AppColors.mainColor),
    foregroundColor: AppColors.mainBlackColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainColor),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      overlayColor: MaterialStateProperty.all<Color>(
          AppColors.mainColor.withOpacity(0.2)),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
      foregroundColor: MaterialStateProperty.all<Color>(AppColors.mainColor),
    ),
  ),
  primaryColor: const Color(0xFF1A746B),
  // textTheme: TextTheme(
  //   bodyText1: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 20,
  //     height: 1,
  //     wordSpacing: .1,
  //     color: Colors.black,
  //     letterSpacing: .5,
  //   ),
  //   bodyText2: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 18,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   headline5: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 24,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   headline6: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 22,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   subtitle1: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w600,
  //     fontSize: 18,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   subtitle2: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w600,
  //     fontSize: 16,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   headline4: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w800,
  //     fontSize: 30,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   button: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 19,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   overline: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 14,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   caption: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 15.5,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  // ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.mainColor,
    elevation: 1,
    centerTitle: true,
    // titleTextStyle: GoogleFonts.tajawal(
    //   fontWeight: FontWeight.w500,
    //   height: 1.9,
    //   fontSize: 22,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  // textTheme: TextTheme(
  //   bodyText1: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 20,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   bodyText2: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 18,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   headline5: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 24,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   headline6: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 22,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   subtitle1: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w600,
  //     fontSize: 18,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   subtitle2: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w600,
  //     fontSize: 16,
  //     height: 1,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   headline4: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w800,
  //     fontSize: 30,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   button: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w700,
  //     fontSize: 19,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   overline: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 14,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  //   caption: GoogleFonts.tajawal(
  //     fontWeight: FontWeight.w500,
  //     fontSize: 15.5,
  //     height: 1.9,
  //     wordSpacing: .1,
  //     letterSpacing: .5,
  //   ),
  // ),
);
