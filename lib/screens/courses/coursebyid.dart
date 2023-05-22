import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/appservices/courseservices.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/formfields/formfields.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/allcourses.dart';
import 'package:etuition/models/home.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/providers/storage.dart';
import 'package:etuition/screens/auth/accountsuccess.dart';
import 'package:etuition/screens/auth/createaccount.dart';
import 'package:etuition/screens/auth/forgotpassword.dart';
import 'package:etuition/screens/prehome/prehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../appservices/accountservices.dart';
import '../../hooks/dialog/alertdialog.dart';

class Coursebyid extends StatefulWidget {
  String? image;
  String? title;
  String? date;

  Coursebyid({this.image, this.title, this.date});

  @override
  State<Coursebyid> createState() => _CoursebyidState();
}

class _CoursebyidState extends State<Coursebyid> {
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
            eText1("${widget.title} course", mqueryHeight(context, .025),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .02)),
            eText1("Kindly select the courses you' would like to take",
                mqueryHeight(context, .017)),
            sbHeight(mqueryHeight(context, .18)),
            getCourseCard(),
            sbHeight(mqueryHeight(context, .02)),
            straightButton("Enroll Now", mqueryHeight(context, .06),
                mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                fontColor: ethcolor.white,
                fontWeight: FontWeight.w600,
                fontSize: mqueryHeight(context, .018), onT: () {
              ethAlert(context,
                  "Enrollment into ${widget.title} currently unavailable at the moment, please try again later");
              //   mynextScreen(context, Verify());
            }),
          ],
        ),
      ),
    );
  }

  Widget getCourseCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: mqueryHeight(context, .015)),
      child: courseCard(
        context,
        image: widget.image,
        courseTitle: widget.title,
        xcolor: ethcolor.white.withOpacity(.4),
        lessonNumber: 4,
        date: widget.date,
      ),
    );
  }
}
