import 'package:etuition/constant/colors.dart';
import 'package:flutter/widgets.dart';



Text eText1(String text, double fontSize,
    {Color? color = ethcolor.bodycolor, FontWeight? fontweight, double? letterSpacing}) {
  return Text(text,
      style: TextStyle(
        fontFamily: "BrfRegular",
        fontSize: fontSize,
        color: color,
        fontWeight: fontweight,
        letterSpacing: letterSpacing,
      ));
}

Text eText2(String text, double fontSize,
    {Color? color, FontWeight? fontweight, double? letterSpacing}) {
  return Text(text,
      style: TextStyle(
        fontFamily: "BroRegular",
        fontSize: fontSize,
        color: color,
        fontWeight: fontweight,
        letterSpacing: letterSpacing,
      ));
}


Text eText3(String text, double fontSize,
    {Color? color, FontWeight? fontweight, double? letterSpacing}) {
  return Text(text,
      style: TextStyle(
        fontFamily: "BrfSemiBold",
        fontSize: fontSize,
        color: color,
        fontWeight: fontweight,
        letterSpacing: letterSpacing,
      ));
}
