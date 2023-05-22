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
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../navigators/navigations.dart';

class AccountSuccess extends StatefulWidget {
  String? name;
  AccountSuccess({this.name});

  @override
  State<AccountSuccess> createState() => _AccountSuccessState();
}

class _AccountSuccessState extends State<AccountSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ethcolor.ethbkgd,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sbHeight(mqueryHeight(context, .25)),
            Center(
                child: Image.asset(
              ImageBloc.success,
              height: mqueryHeight(context, .18),
            )),
            sbHeight(mqueryHeight(context, .05)),
            eText1("Your account has been\n   created successfully",
                mqueryHeight(context, .026),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .08)),
            straightButton("Let's go", mqueryHeight(context, .06),
                mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                fontColor: ethcolor.white,
                fontWeight: FontWeight.w600,
                fontSize: mqueryHeight(context, .018), onT: () {
              mynextScreen(
                  context,
                  Login(
                    name: widget.name,
                  ));
            }),
          ],
        ),
      ),
    );
  }
}
