import 'dart:convert';
import 'package:etuition/appservices/courseservices.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/singlecourse.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../hooks/dialog/alertdialog.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          children: [
             eText1("My Courses",
                      mqueryHeight(context, .025),
                      fontweight: FontWeight.w900,
                      color: ethcolor.headingblack),
          ],
        ),
      ),
    );
  }
}
