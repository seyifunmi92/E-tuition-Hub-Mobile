import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/formfields/formfields.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/auth/verify.dart';
import 'package:etuition/screens/prehome/courses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreHome extends StatefulWidget {
  const PreHome({super.key});

  @override
  State<PreHome> createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ethcolor.ethbkgd,
      appBar: ethAppBar(context, "", showElevation: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            eText1("Let's Know you better", mqueryHeight(context, .025),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .02)),
            eText1("Which of these best describes you?",
                mqueryHeight(context, .017)),
            sbHeight(mqueryHeight(context, .03)),
            Center(
              child: circle("Professional\n     student"),
            ),
            sbHeight(mqueryHeight(context, .02)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mqueryWidth(context, .07)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  circle("Elementary\n     student"),
                  circle("O'level\nstudent"),
                ],
              ),
            ),
            sbHeight(mqueryHeight(context, .02)),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mqueryWidth(context, .07)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  circle("Others"),
                  circle("A'level\nstudent"),
                ],
              ),
            ),
            sbHeight(mqueryHeight(context, .09)),
            straightButton("Proceed", mqueryHeight(context, .06),
                mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                fontColor: ethcolor.white,
                fontWeight: FontWeight.w600,
                fontSize: mqueryHeight(context, .018), onT: () {
              mynextScreen(context, RecCourses());
            }),
          ],
        ),
      ),
    );
  }

  circle(String text) {
    return CircleAvatar(
      backgroundColor: const Color(0xff666666),
      radius: 70,
      child: Center(
          child:
              eText1(text, mqueryHeight(context, .016), color: ethcolor.white)),
    );
  }
}
