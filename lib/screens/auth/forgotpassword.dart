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
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/auth/login.dart';
import 'package:etuition/screens/auth/psuccess.dart';
import 'package:etuition/screens/auth/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../appservices/accountservices.dart';
import '../../hooks/dialog/alertdialog.dart';
import '../../navigators/navigations.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:
          Provider.of<AccountServices>(context, listen: false).isLoading,
      progressIndicator: Loader(),
      child: Scaffold(
        appBar: ethAppBar(context, "", showElevation: false),
        backgroundColor: ethcolor.ethbkgd,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              eText1("Forgot Password", mqueryHeight(context, .025),
                  fontweight: FontWeight.w900, color: ethcolor.headingblack),
              sbHeight(mqueryHeight(context, .02)),
              eText1("Please enter your verified email to get the reset link",
                  mqueryHeight(context, .017)),
              sbHeight(mqueryHeight(context, .03)),
              eText1("Email Address", mqueryHeight(context, .017),
                  color: ethcolor.headingblack, fontweight: FontWeight.w600),
              sbHeight(mqueryHeight(context, .01)),
              ethFormField(
                  context, mqueryHeight(context, .06), mqueryWidth(context, 1),
                  containercolor: Color(0xffA09696).withOpacity(.1),
                  showRadius: true,
                  showBorder: false,
                  radiusborder: true,
                  title: "oluwaseyi@nerdbug.io",
                  controller: email),
              sbHeight(mqueryHeight(context, .1)),
              straightButton("Send Reset Link", mqueryHeight(context, .06),
                  mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                  fontColor: ethcolor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: mqueryHeight(context, .018), onT: () {
                email.text.isEmpty
                    ? toast("Please enter email to proceed")
                    : _runCall();
              }),
              sbHeight(mqueryHeight(context, .03)),
              Center(
                  child: eText1("Any issues?", mqueryHeight(context, .017),
                      color: const Color(0xffCAA74E))),
            ],
          ),
        ),
      ),
    );
  }

  _runCall() {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = true;
    });
    _resetPassword();
  }

  _resetPassword() {
    Provider.of<AccountServices>(context, listen: false)
        .resetPassword(email.text)
        .then((value) => output(value));
  }

  output(String x) {
    print(x);
    var bodyT = jsonDecode(x);
    bodyT["code"] == 200 ? xSuccessotp(bodyT) : xFailedotp(bodyT);
  }

  xSuccessotp(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
    });
    mynextScreen(context, PSuccess());
    toast(
      x["message"],
    );
  }

  xFailedotp(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
    });

    ethAlert(context, x["message"]);
  }
}
