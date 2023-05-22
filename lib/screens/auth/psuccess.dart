import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/screens/auth/login.dart';
import 'package:etuition/screens/auth/preset.dart';
import 'package:flutter/material.dart';
import '../../navigators/navigations.dart';

class PSuccess extends StatefulWidget {
  const PSuccess({super.key});

  @override
  State<PSuccess> createState() => _PSuccessState();
}

class _PSuccessState extends State<PSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ethAppBar(context, "",showElevation: false),
      backgroundColor: ethcolor.ethbkgd,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sbHeight(mqueryHeight(context, .12)),
            Center(
                child: Image.asset(
              ImageBloc.success,
              height: mqueryHeight(context, .18),
            )),
            sbHeight(mqueryHeight(context, .05)),
            eText1("A verification link has been\n          sent to your email",
                mqueryHeight(context, .026),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .08)),
            straightButton("Reset Password", mqueryHeight(context, .06),
                mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                fontColor: ethcolor.white,
                fontWeight: FontWeight.w600,
                fontSize: mqueryHeight(context, .018), onT: () {
              mynextScreen(context, Preset());
            }),
          ],
        ),
      ),
    );
  }
}
