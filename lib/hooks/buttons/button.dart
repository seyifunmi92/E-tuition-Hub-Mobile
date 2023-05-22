import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/providers/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget straightButton(
    String text, double height, double width, Color color, double radius,
    {double? fontSize,
    Color? fontColor,
    bool showBorder = false,
    FontWeight fontWeight = FontWeight.w500,
    void Function()? onT}) {
  return InkWell(
    onTap: onT,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder == true
              ? Border.all(color: ethcolor.primaryColor)
              : null),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          fontFamily: "BrfRegular",
          fontSize: fontSize,
          color: fontColor,
          fontWeight: fontWeight,
          letterSpacing: .3,
        ),
      )),
    ),
  );
}

Widget straightButtonIcon(
    String icon, double height, double width, Color color, double radius,
    {double? fontSize,
    double? IconSize,
    Color? fontColor,
    bool showBorder = false,
    FontWeight fontWeight = FontWeight.w500,
    void Function()? onT}) {
  return InkWell(
    onTap: onT,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder == true
              ? Border.all(color: ethcolor.black.withOpacity(.4))
              : null),
      child: Center(child: Image.asset(icon, height: IconSize)),
    ),
  );
}
