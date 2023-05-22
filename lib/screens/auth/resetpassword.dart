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
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/auth/login.dart';
import 'package:etuition/screens/auth/psuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../navigators/navigations.dart';

class Reset extends StatefulWidget {
  const Reset({super.key});

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: ethAppBar(context, "", showElevation: false),
      backgroundColor: ethcolor.ethbkgd,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            eText1("Reset Password", mqueryHeight(context, .025),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .02)),
            eText1(
                "Please enter your new password", mqueryHeight(context, .017)),
            sbHeight(mqueryHeight(context, .04)),
            eText1("Old Password", mqueryHeight(context, .017),
                color: ethcolor.headingblack, fontweight: FontWeight.w600),
            sbHeight(mqueryHeight(context, .01)),
            ethFormField(
                context, mqueryHeight(context, .06), mqueryWidth(context, 1),
                containercolor: Color(0xffA09696).withOpacity(.1),
                showRadius: true,
                showBorder: false,
                radiusborder: true),
            sbHeight(mqueryHeight(context, .03)),
            eText1("New Password", mqueryHeight(context, .017),
                color: ethcolor.headingblack, fontweight: FontWeight.w600),
            sbHeight(mqueryHeight(context, .01)),
            ethFormField(
                context, mqueryHeight(context, .06), mqueryWidth(context, 1),
                containercolor: Color(0xffA09696).withOpacity(.1),
                showRadius: true,
                showBorder: false,
                radiusborder: true),
            sbHeight(mqueryHeight(context, .03)),
            eText1("Confirm Password", mqueryHeight(context, .017),
                color: ethcolor.headingblack, fontweight: FontWeight.w600),
            sbHeight(mqueryHeight(context, .01)),
            ethFormField(
                context, mqueryHeight(context, .06), mqueryWidth(context, 1),
                containercolor: Color(0xffA09696).withOpacity(.1),
                showRadius: true,
                showBorder: false,
                radiusborder: true),
            sbHeight(mqueryHeight(context, .29)),
            straightButton("Update", mqueryHeight(context, .06),
                mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                fontColor: ethcolor.white,
                fontWeight: FontWeight.w600,
                fontSize: mqueryHeight(context, .018), onT: () {
              mynextScreen(context, PSuccess());
            }),
          ],
        ),
      ),
    );
  }
}
