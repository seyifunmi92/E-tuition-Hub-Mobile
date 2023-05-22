import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../navigators/navigations.dart';

AppBar ethAppBar(BuildContext context, String title,
    {bool showBack = true,
    bool isCenter = true,
    bool showElevation = true,
    bool showLogo = false,
    List<Widget>? actions,
    Color? color}) {
  return AppBar(
    backgroundColor: ethcolor.white,
    toolbarHeight: mqueryHeight(context, .075),
    automaticallyImplyLeading: false,
    centerTitle: isCenter ? true : false,
    elevation: showElevation ? .2 : 0,
    title: Text(
      title,
      style: TextStyle(
        fontFamily: "BrfRegular",
        color: Colors.black,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
        fontSize: mqueryHeight(context, .022),
      ),
    ),
    leading: !showBack
        ? null
        : InkWell(
            onTap: () {
              finishContext(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: mqueryHeight(context, .025),
              color: ethcolor.black,
            ),
          ),
    actions: actions,
  );
}
