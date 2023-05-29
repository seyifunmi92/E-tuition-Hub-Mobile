import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/formfields/formfields.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/storage.dart';
import 'package:etuition/screens/auth/createaccount.dart';
import 'package:etuition/screens/auth/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../appservices/accountservices.dart';
import '../../hooks/dialog/alertdialog.dart';
import '../home/home.dart';

class Login extends StatefulWidget {
  String? name;
  Login({this.name});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    nameCheck();
    super.initState();
  }

  String username = "";
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
              eText1("Welcome ${username}", mqueryHeight(context, .025),
                  fontweight: FontWeight.w900, color: ethcolor.headingblack),
              sbHeight(mqueryHeight(context, .02)),
              eText1("Please enter your details to proceed",
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
                  controller: email),
              sbHeight(mqueryHeight(context, .03)),
              eText1("Password", mqueryHeight(context, .017),
                  color: ethcolor.headingblack, fontweight: FontWeight.w600),
              sbHeight(mqueryHeight(context, .01)),
              ethFormField(
                  context, mqueryHeight(context, .06), mqueryWidth(context, 1),
                  containercolor: const Color(0xffA09696).withOpacity(.1),
                  showRadius: true,
                  showBorder: false,
                  radiusborder: true,
                  controller: password),
              sbHeight(mqueryHeight(context, .02)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      mynextScreen(context, ForgotPassword());
                    },
                    child: eText1(
                        "Forgot Password?", mqueryHeight(context, .015),
                        color: const Color(0xffF95959)),
                  ),
                ],
              ),
              sbHeight(mqueryHeight(context, .03)),
              straightButton("Login", mqueryHeight(context, .06),
                  mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                  fontColor: ethcolor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: mqueryHeight(context, .018), onT: () {
                email.text.isEmpty || password.text.isEmpty
                    ? toast("Please enter OTP to proceed")
                    : _runCall();
                //   mynextScreen(context, Verify());
              }),
              sbHeight(mqueryHeight(context, .02)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  eText1("Don't have an account?", mqueryHeight(context, .015),
                      color: ethcolor.black),
                  InkWell(
                    onTap: () {
                      mynextScreen(context, CreateAccount());
                    },
                    child: eText1(" Sign Up", mqueryHeight(context, .015),
                        color: Color(0xffCAA74E)),
                  ),
                ],
              ),
              sbHeight(mqueryHeight(context, .06)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: ethcolor.primaryColor,
                    height: mqueryHeight(context, .001),
                    width: mqueryWidth(context, .4),
                  ),
                  eText1("OR", mqueryHeight(context, .016)),
                  Container(
                    color: ethcolor.primaryColor,
                    height: mqueryHeight(context, .001),
                    width: mqueryWidth(context, .4),
                  ),
                ],
              ),
              sbHeight(mqueryHeight(context, .06)),
              straightButtonIcon(
                ImageBloc.google,
                mqueryHeight(context, .06),
                mqueryWidth(context, 1),
                ethcolor.transparent,
                30,
                showBorder: true,
                IconSize: mqueryHeight(context, .023),
              ),
              sbHeight(mqueryHeight(context, .01)),
              straightButtonIcon(ImageBloc.apple, mqueryHeight(context, .06),
                  mqueryWidth(context, 1), ethcolor.transparent, 30,
                  showBorder: true, IconSize: mqueryHeight(context, .023)),
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
    login();
  }

  login() {
    Provider.of<AccountServices>(context, listen: false)
        .loginUser(email.text, password.text)
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
    Provider.of<storageBloc>(context, listen: false)
        .storeToken(x["data"]["accessToken"]);
    Provider.of<storageBloc>(context, listen: false)
        .setName(x["data"]["user"]["firstName"]);
    Provider.of<storageBloc>(context, listen: false)
        .setTime(DateFormat("dd MMMM yyyy hh:mm aaa").format(DateTime.now()));
    mynextScreen(context, Home(name: x["data"]["user"]["firstName"]));

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

  nameCheck() {
    if (widget.name != null) {
      setState(() {
        username = widget.name!;
      });
    } else {
      setState(() {
        username = "";
      });
    }
  }
}
