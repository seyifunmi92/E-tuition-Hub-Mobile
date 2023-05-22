import 'package:etuition/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppTheme{
  AppTheme._();
  static final ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: ethcolor.background,
    canvasColor: ethcolor.background,
    cardColor: ethcolor.white,
    cardTheme: const CardTheme(shadowColor: ethcolor.offWhite),
    accentColor: ethcolor.primaryColor,
    dividerColor: ethcolor.secondary3,
    fontFamily: "BrfRegular",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          letterSpacing: -0.25, fontSize: 14, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(
          letterSpacing: -0.25, fontSize: 16, fontWeight: FontWeight.w400),
    ).apply(bodyColor: ethcolor.black.withOpacity(.9), displayColor: ethcolor.secondary3),
    appBarTheme: const AppBarTheme(
        color: ethcolor.background,
        iconTheme: IconThemeData(color: ethcolor.primaryColor)),
    colorScheme: const  ColorScheme.light(
        onPrimary: ethcolor.white,
        primary: ethcolor.primaryColor,
        secondary: ethcolor.primaryColor,
        error: ethcolor.accentColorDark),
    iconTheme: const IconThemeData(
      color: ethcolor.primaryColor,
    ),
  );

  static final ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: ethcolor.black,
    canvasColor: ethcolor.black,
    accentColor: ethcolor.white,
    fontFamily: "BrfRegular",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          letterSpacing: -0.25, fontSize: 14, fontWeight: FontWeight.w400),
      bodyText2: TextStyle(
          letterSpacing: -0.25, fontSize: 16, fontWeight: FontWeight.w400),
    ).apply(bodyColor: ethcolor.white, displayColor: ethcolor.secondary3),

  );
}