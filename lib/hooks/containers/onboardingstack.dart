import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/customtexts.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/courses/courses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../navigators/navigations.dart';
import '../../screens/home/home.dart';

Widget onboardingStack(BuildContext context, obSlides x) {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .07)),
        child: Column(
          children: [
            sbHeight(mqueryHeight(context, .04)),
            Container(
              height: mqueryHeight(context, .55),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(x.image), fit: BoxFit.contain)),
            ),
          ],
        ),
      ),
      Scaffold(
        backgroundColor: ethcolor.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sbHeight(mqueryHeight(context, .65)),
              Center(
                child: eText2(x.title, mqueryHeight(context, .031),
                    color: const Color(0xff08151E),
                    fontweight: FontWeight.w800,
                    letterSpacing: .1),
              ),
              sbHeight(mqueryHeight(context, .02)),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: mqueryWidth(context, .07)),
                child: eText1(
                  x.subTitle,
                  mqueryHeight(context, .0175),
                  color: const Color(0xff666666),
                  letterSpacing: .06,
                ),
              ),
              sbHeight(mqueryHeight(context, .02)),
            ],
          ),
        ),
      )
    ],
  );
}

Widget courseCard(BuildContext context,
    {Color? xcolor,
    String? courseTitle,
    int? lessonNumber,
    String? image,
    String? date}) {
  return Container(
    width: mqueryWidth(context, 1),
    height: mqueryHeight(context, .1),
    decoration: BoxDecoration(
      color: xcolor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurStyle: BlurStyle.outer,
          blurRadius: 30,
          spreadRadius: 0,
          offset: Offset.zero,
        ),
      ],
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image!),
              radius: 28,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sbHeight(mqueryHeight(context, .02)),
                eText2(courseTitle!, mqueryHeight(context, .016),
                    fontweight: FontWeight.w600),
                sbHeight(mqueryHeight(context, .005)),
                eText1("${lessonNumber} lessons", mqueryHeight(context, .014),
                    fontweight: FontWeight.w300, color: ethcolor.black),
                sbHeight(mqueryHeight(context, .005)),
                eText1("Expiring on ${date}", mqueryHeight(context, .012),
                    fontweight: FontWeight.w300),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget notificationCard(BuildContext context,
    {Color? xcolor, String? notification, String? date}) {
  return Container(
    width: mqueryWidth(context, 1),
    height: mqueryHeight(context, .1),
    decoration: BoxDecoration(
      color: xcolor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurStyle: BlurStyle.outer,
          blurRadius: 30,
          spreadRadius: 0,
          offset: Offset.zero,
        ),
      ],
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .055)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sbHeight(mqueryHeight(context, .029)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: mqueryWidth(context, .7),
                  child: eText2(notification!, mqueryHeight(context, .017),
                      fontweight: FontWeight.w500,
                      color: ethcolor.black.withOpacity(.7)),
                ),
              ],
            ),
            sbHeight(mqueryHeight(context, .005)),
            sbHeight(mqueryHeight(context, .005)),
            eText1(date!, mqueryHeight(context, .012),
                fontweight: FontWeight.w300),
          ],
        ),
      ),
    ),
  );
}

Widget pageIndicator(BuildContext context, int currentIndex,
    {Color? color, Color? color2}) {
  return AnimatedSmoothIndicator(
    effect: ExpandingDotsEffect(
      dotColor: color2!,
      activeDotColor: color!,
      spacing: 7,
      radius: 50,
      dotHeight: 9,
      dotWidth: 13,
    ),
    activeIndex: currentIndex,
    count: onboardingSlides.length,
  );
}

Widget bottomNavDash(
  BuildContext context, {
  bool showIcon = true,
  bool isHome = false,
  bool isSearch = false,
  bool isLiveStream = false,
  bool isLearn = false,
  bool isAccount = false,
}) {
  return Container(
    height: mqueryHeight(context, .1),
    decoration: BoxDecoration(
        color: ethcolor.offWhite, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: EdgeInsets.only(top: mqueryHeight(context, .025)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              showIcon
                  ? InkWell(
                      onTap: !isHome
                          ? () {
                              mynextScreen(context, Home());
                            }
                          : null,
                      child: Image.asset(
                        ImageBloc.home,
                        height: mqueryHeight(context, .02),
                        color: isHome ? ethcolor.primaryColor : null,
                      ),
                    )
                  : Text(""),
              sbHeight(mqueryHeight(context, .012)),
              eText1("Home", mqueryHeight(context, .011),
                  color: isHome ? ethcolor.primaryColor : ethcolor.black)
            ],
          ),
          Column(
            children: [
              showIcon
                  ? InkWell(
                      onTap: () {
                        //  mynextScreen(context, Wallet());
                      },
                      child: Image.asset(
                        ImageBloc.search,
                        height: mqueryHeight(context, .02),
                        color: isSearch ? ethcolor.primaryColor : null,
                      ),
                    )
                  : Text(""),
              sbHeight(mqueryHeight(context, .01)),
              eText1("Search", mqueryHeight(context, .011),
                  color: isSearch ? ethcolor.primaryColor : ethcolor.black),
            ],
          ),
          Column(
            children: [
              showIcon
                  ? InkWell(
                      onTap: () {
                        //      mynextScreen(context, Nearme());
                      },
                      child: Image.asset(
                        ImageBloc.live,
                        height: mqueryHeight(context, .02),
                        color: isLiveStream ? ethcolor.primaryColor : null,
                      ),
                    )
                  : Text(""),
              sbHeight(mqueryHeight(context, .01)),
              eText1("Livestream", mqueryHeight(context, .011),
                  color: isLiveStream ? ethcolor.primaryColor : ethcolor.black)
            ],
          ),
          Column(
            children: [
              showIcon
                  ? InkWell(
                      onTap: () {
                        mynextScreen(context, AllCourses());
                      },
                      child: Image.asset(
                        ImageBloc.learn,
                        height: mqueryHeight(context, .02),
                        color: isLearn ? ethcolor.primaryColor : null,
                      ),
                    )
                  : Text(""),
              sbHeight(mqueryHeight(context, .01)),
              eText1("Learn", mqueryHeight(context, .011),
                  color: isLearn ? ethcolor.primaryColor : ethcolor.black)
            ],
          ),
          Column(
            children: [
              showIcon
                  ? InkWell(
                      onTap: () {
                        //        mynextScreen(context, OrderHistory());
                      },
                      child: Image.asset(
                        ImageBloc.acct,
                        height: mqueryHeight(context, .02),
                        color: isAccount ? ethcolor.primaryColor : null,
                      ),
                    )
                  : Text(""),
              sbHeight(mqueryHeight(context, .01)),
              eText1("Account", mqueryHeight(context, .012),
                  color: isAccount ? ethcolor.primaryColor : ethcolor.black)
            ],
          ),
        ],
      ),
    ),
  );
}
