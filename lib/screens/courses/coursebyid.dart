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

class Coursebyid extends StatefulWidget {
  String? image;
  String? title;
  String? date;
  int? id;

  Coursebyid({this.image, this.title, this.date, this.id});

  @override
  State<Coursebyid> createState() => _CoursebyidState();
}

class _CoursebyidState extends State<Coursebyid> {
  bool isLoading = false;
  SingleCourse? xsingle;
  @override
  void initState() {
    isLoading = true;
    _getSingleCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Scaffold(
            backgroundColor: ethcolor.ethbkgd,
            appBar: ethAppBar(context, "", showElevation: false),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  eText1("${xsingle!.data.name} course",
                      mqueryHeight(context, .025),
                      fontweight: FontWeight.w900,
                      color: ethcolor.headingblack),
                  sbHeight(mqueryHeight(context, .02)),
                  imageContainer(),
                  sbHeight(mqueryHeight(context, .02)),
                  eText1("By ${xsingle!.data.createdBy}",
                      mqueryHeight(context, .017),
                      color: ethcolor.primaryColor),
                  sbHeight(mqueryHeight(context, .01)),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffFFE7A6),
                      ),
                      eText1("${xsingle!.data.averageRating} rating",
                          mqueryHeight(context, .017),
                          color: ethcolor.primaryColor),
                    ],
                  ),
                  sbHeight(mqueryHeight(context, .01)),
                  eText1(
                      "${xsingle!.data.totalEnrolled - 1} + students enrolled ",
                      mqueryHeight(context, .017),
                      color: ethcolor.primaryColor),
                  sbHeight(mqueryHeight(context, .01)),
                  eText1("Overview", mqueryHeight(context, .018),
                      color: ethcolor.primaryColor,
                      fontweight: FontWeight.w600),
                  sbHeight(mqueryHeight(context, .01)),
                  eText1("About the course", mqueryHeight(context, .018),
                      color: ethcolor.black, fontweight: FontWeight.w600),
                  sbHeight(mqueryHeight(context, .01)),
                  eText1(xsingle!.data.description, mqueryHeight(context, .018),
                      color: ethcolor.black.withOpacity(.4),
                      fontweight: FontWeight.w500),
                  sbHeight(mqueryHeight(context, .14)),
                  straightButton("Join Course", mqueryHeight(context, .06),
                      mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                      fontColor: ethcolor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: mqueryHeight(context, .018), onT: () {
                    ethAlert(context,
                        "Enrollment into ${widget.title} currently unavailable at the moment, please try again later");
                  }),
                  sbHeight(mqueryHeight(context, .014)),
                  straightButton("Leave Course", mqueryHeight(context, .06),
                      mqueryWidth(context, 1), ethcolor.white, 30,
                      showBorder: true,
                      fontColor: ethcolor.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: mqueryHeight(context, .018), onT: () {
                    ethAlert(context,
                        "Enrollment into ${widget.title} currently unavailable at the moment, please try again later");
                  }),
                ],
              ),
            ),
          )
        : Scaffold(
            body: Center(child: Loader()),
          );
  }

  imageContainer() {
    return Container(
      height: mqueryHeight(context, .28),
      width: mqueryWidth(context, 1),
      child: Stack(
        children: [
          Image.network(xsingle!.data.image),
          Scaffold(
            backgroundColor: Colors.black54,
            body: Center(
                child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.play_arrow))),
          ),
        ],
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

  _getSingleCourse() {
    Provider.of<courseServices>(context, listen: false)
        .getSingleCourse(widget.id!)
        .then((value) => output(value));
  }

  output(String x) {
    print(x);
    var xx = jsonDecode(x);
    if (xx["code"] == 200) {
      setState(() {
        xsingle = SingleCourse.fromJson(xx);
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}
