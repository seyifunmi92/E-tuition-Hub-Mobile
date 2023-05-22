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
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../appservices/accountservices.dart';
import '../../hooks/dialog/alertdialog.dart';

class Not extends StatefulWidget {
  const Not({super.key});

  @override
  State<Not> createState() => _NotState();
}

class _NotState extends State<Not> {
  String _time = "";

  @override
  void initState() {
    _getLoginTime();
    super.initState();
  }

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
            eText1("Notifications", mqueryHeight(context, .025),
                fontweight: FontWeight.w900, color: ethcolor.headingblack),
            sbHeight(mqueryHeight(context, .02)),
            notificationCard(context,
                xcolor: ethcolor.white,
                notification:
                    "There was a login action on this account at $_time",
                date: "")
          ],
        ),
      ),
    );
  }

  _getLoginTime() async {
    SharedPreferences x = await SharedPreferences.getInstance();
    var xx = x.getString("time");
    if (xx != null) {
      setState(() {
        _time = xx;
      });
    } else {
      setState(() {
        _time = DateFormat("dd MMMM yyyy hh:mm aaa").format(DateTime.now());
      });
    }
  }
}
