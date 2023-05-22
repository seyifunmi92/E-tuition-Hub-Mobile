import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/appservices/accountservices.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/formfields/formfields.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/auth/accountsuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../hooks/dialog/alertdialog.dart';
import '../../providers/validationbloc.dart';

class Verify extends StatefulWidget {
  String? email;
  Verify({this.email});

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:
          Provider.of<AccountServices>(context, listen: false).isLoading,
      progressIndicator: Loader(),
      child: Scaffold(
        backgroundColor: ethcolor.ethbkgd,
        appBar: ethAppBar(context, "", showElevation: false),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mqueryWidth(context, .045)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              eText1("Let's Verify You", mqueryHeight(context, .025),
                  fontweight: FontWeight.w900, color: ethcolor.headingblack),
              sbHeight(mqueryHeight(context, .02)),
              eText1("Please enter your 5-digit reset code sent to your email",
                  mqueryHeight(context, .017)),
              sbHeight(mqueryHeight(context, .04)),
              Center(
                child: ethFormField(
                  context,
                  mqueryHeight(context, .05),
                  mqueryWidth(context, .2),
                  containercolor: Color(0xffA09696).withOpacity(.1),
                  showRadius: true,
                  showBorder: false,
                  isInt: true,
                  maxlength: 6,
                  onT: () {
                    setState(() {
                      Provider.of<validationBloc>(context, listen: false)
                          .validPassword = true;
                    });
                  },
                  radiusborder: true,
                  controller: otp,
                ),
              ),
              sbHeight(mqueryHeight(context, .08)),
              straightButton("Verify Email", mqueryHeight(context, .06),
                  mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                  fontColor: ethcolor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: mqueryHeight(context, .018), onT: () {
                otp.text.isEmpty
                    ? toast("Please enter OTP to proceed")
                    : _runCall();
              }),
              sbHeight(mqueryHeight(context, .03)),
              Center(
                  child: InkWell(
                onTap: () {
                  _runCallotp();
                },
                child: eText1(
                    "Any issues? Resend OTP", mqueryHeight(context, .017),
                    color: const Color(0xffCAA74E)),
              )),
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
    _verifyOtp();
  }

  _runCallotp() {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = true;
    });
    _resendOtp();
  }

  _verifyOtp() {
    Provider.of<AccountServices>(context, listen: false)
        .verifyOtp(otp.text, widget.email!)
        .then((value) => xOutput(value));
  }

  xOutput(String x) {
    print(x);
    var bodyT = jsonDecode(x);
    bodyT["code"] == 200 ? xSuccess(bodyT) : xFailed(bodyT);
  }

  xSuccess(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
    });
    mynextScreen(context, AccountSuccess(name: x["data"]["user"]["firstName"]));

    toast(
      x["message"],
    );
  }

  xFailed(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
    });
    ethAlert(context, x["message"]);
  }

  _resendOtp() {
    Provider.of<AccountServices>(context, listen: false)
        .resendOtp(widget.email!)
        .then((value) => xOutputotp(value));
  }

  xOutputotp(String x) {
    print(x);
    var bodyT = jsonDecode(x);
    bodyT["status"] == 200 ? xSuccessotp(bodyT) : xFailedotp(bodyT);
  }

  xSuccessotp(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
      otp.clear();
    });

    toast(
      x["message"],
    );
  }

  xFailedotp(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
      otp.clear();
    });
    print("hreeee");
    ethAlert(context, x["message"]);
  }
}
