import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/formfields/formfields.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
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
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../appservices/accountservices.dart';
import '../../hooks/dialog/alertdialog.dart';
import '../notifications/notification.dart';

class Home extends StatefulWidget {
  String? name;
  Home({this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;
  int index = 0;
  String selectedCourse = "";
  @override
  void initState() {
    _getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavDash(context, isHome: true),
      backgroundColor: ethcolor.ethbkgd,
      //   appBar: ethAppBar(context, "", showElevation: false, showBack: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sbHeight(mqueryHeight(context, .1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                eText1("Hi ${widget.name}", mqueryHeight(context, .025),
                    fontweight: FontWeight.w900, color: ethcolor.headingblack),
                InkWell(
                  onTap: () {
                    mynextScreen(context, Not());
                  },
                  child: Icon(Icons.notifications),
                )
              ],
            ),
            sbHeight(mqueryHeight(context, .01)),
            eText1("Welcome to E tuition", mqueryHeight(context, .017)),
            sbHeight(mqueryHeight(context, .03)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...allCourses.map((e) => contain(e)),
                ],
              ),
            ),
            sbHeight(mqueryHeight(context, .03)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                eText1("Ongoing courses", mqueryHeight(context, .023),
                    fontweight: FontWeight.w900, color: ethcolor.headingblack),
                InkWell(
                  onTap: () {},
                  child: eText1("View All", mqueryHeight(context, .017),
                      color: Color(0xffCAA74E)),
                ),
              ],
            ),
            sbHeight(mqueryHeight(context, .03)),
            eText1("Click on the course to resume your learning",
                mqueryHeight(context, .017)),
            sbHeight(mqueryHeight(context, .03)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                courseContain(ImageBloc.physics, "10", "Mathematics", "10"),
                courseContain(ImageBloc.maths, "70", "Physics", "5"),
              ],
            ),
            sbHeight(mqueryHeight(context, .03)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                courseContain(ImageBloc.physics, "30", "Biology", "15"),
                courseContain(ImageBloc.maths, "40", "Chemistry", "25"),
              ],
            )
          ],
        ),
      ),
    );
  }

  contain(Courses x) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .01)),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedCourse = x.course;
            index++;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ethcolor.primaryColor.withOpacity(.2))),
          height: mqueryHeight(context, .025),
          width: mqueryWidth(context, .15),
          child: Center(
            child: eText1(x.course, mqueryHeight(context, .012)),
          ),
        ),
      ),
    );
  }

  courseContain(
      String image, String percentage, String courseTitle, String lesson) {
    return Container(
      height: mqueryHeight(context, .22),
      width: mqueryWidth(context, .44),
      decoration: BoxDecoration(
        color: ethcolor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurStyle: BlurStyle.outer,
            blurRadius: 20,
            spreadRadius: 0,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: mqueryWidth(context, .02),
            right: mqueryWidth(context, .02),
            top: mqueryHeight(context, .001),
            bottom: mqueryHeight(context, .02)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: mqueryHeight(context, .1),
            ),
            sbHeight(mqueryHeight(context, .01)),
            eText1("$percentage%", mqueryHeight(context, .013),
                color: ethcolor.primaryColor),
            sbHeight(mqueryHeight(context, .01)),
            eText1(courseTitle, mqueryHeight(context, .013),
                color: ethcolor.black, fontweight: FontWeight.w600),
            sbHeight(mqueryHeight(context, .01)),
            eText1("${lesson} lessons", mqueryHeight(context, .013),
                color: Color(0xff6D6D6D)),
          ],
        ),
      ),
    );
  }

  _getName() async {
    SharedPreferences x = await SharedPreferences.getInstance();
    var xx = x.getString("name");
    if (xx != null) {
      setState(() {
        widget.name = xx;
      });
    }
  }
}
