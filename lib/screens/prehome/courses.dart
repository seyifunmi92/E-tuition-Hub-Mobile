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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecCourses extends StatefulWidget {
  const RecCourses({super.key});

  @override
  State<RecCourses> createState() => _RecCoursesState();
}

class _RecCoursesState extends State<RecCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ethAppBar(context, "", showElevation: false),
      backgroundColor: ethcolor.ethbkgd,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            eText1("Recommended courses", mqueryHeight(context, .025),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .02)),
            eText1(
                "We’ve curated a pool of knowledge to make you get better as a proffessional.",
                mqueryHeight(context, .017)),
            sbHeight(mqueryHeight(context, .03)),
          ],
        ),
      ),
    );
  }
}
