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
import 'package:etuition/screens/courses/coursebyid.dart';
import 'package:etuition/screens/prehome/prehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../appservices/accountservices.dart';
import '../../hooks/dialog/alertdialog.dart';

class AllCourses extends StatefulWidget {
  const AllCourses({super.key});

  @override
  State<AllCourses> createState() => _AllCoursesState();
}

class _AllCoursesState extends State<AllCourses> {
  bool emptyList = false;
  Allcourses? xcourses;
  List<Datum>? xcourseList;
  bool showloader = false;
  @override
  void initState() {
    showloader = true;
    _getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ethAppBar(context, "", showElevation: false),
      backgroundColor: ethcolor.ethbkgd,
      bottomNavigationBar: bottomNavDash(context, isLearn: true),
      body: showloader
          ? Loader()
          : !showloader && emptyList
              ? emptyListData()
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mqueryWidth(context, .045)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      eText1("Recommended Courses", mqueryHeight(context, .025),
                          fontweight: FontWeight.w900,
                          color: ethcolor.headingblack),
                      sbHeight(mqueryHeight(context, .02)),
                      eText1(
                          "We’ve curated a pool of knowledge to make you get better as a proffessional.",
                          mqueryHeight(context, .017)),
                      sbHeight(mqueryHeight(context, .04)),
                      ...xcourseList!.map((e) => getCourseCard(e)),

                      //  courseCard(context, Colors.blueGrey, "Titlse", 5, ImageBloc.google)
                    ],
                  ),
                ),
    );
  }

  Widget getCourseCard(Datum xc) {
    return InkWell(
      onTap: () {
        mynextScreen(
            context,
            Coursebyid(
              image: xc.image,
              title: xc.name,
              date: DateFormat("dd MMMM yyyy").format(xc.updatedAt),
            ));
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: mqueryHeight(context, .015)),
        child: courseCard(
          context,
          image: xc.image,
          courseTitle: xc.name,
          xcolor: ethcolor.white.withOpacity(.4),
          lessonNumber: 4,
          date: DateFormat("dd MMMM yyyy").format(xc.updatedAt),
        ),
      ),
    );
  }

  Widget emptyListData() {
    return Column(
      children: [],
    );
  }

  _getAllCourses() {
    Provider.of<courseServices>(context, listen: false)
        .getAllCourseCategories()
        .then((value) => output(value));
  }

  output(String xx) {
    print("let get course naaa");
    print(xx);

    var x = jsonDecode(xx);
    if (x["code"] == 200) {
      List courseList = x["data"];
      if (courseList.isEmpty) {
        setState(() {
          emptyList = true;
          showloader = false;
        });
      } else {
        setState(() {
          emptyList = false;
          showloader = false;
          xcourseList =
              courseList.map<Datum>((e) => Datum.fromJson(e)).toList();
        });
      }
    }
  }
}
