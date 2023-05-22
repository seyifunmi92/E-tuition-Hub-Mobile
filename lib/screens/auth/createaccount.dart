import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/appservices/accountservices.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/appbars/appbar.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/dialog/alertdialog.dart';
import 'package:etuition/hooks/formfields/formfields.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/providers/validationbloc.dart';
import 'package:etuition/screens/auth/verify.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  String fullNameValidation = "";
  String emailValidation = "";
  String passValidation = "";

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                eText1("Create Account", mqueryHeight(context, .025),
                    fontweight: FontWeight.w900, color: ethcolor.headingblack),
                sbHeight(mqueryHeight(context, .02)),
                eText1("Please fill up your details to help know you better",
                    mqueryHeight(context, .017)),
                sbHeight(mqueryHeight(context, .03)),
                eText1("Full Name", mqueryHeight(context, .017),
                    color: ethcolor.headingblack, fontweight: FontWeight.w600),
                sbHeight(mqueryHeight(context, .01)),
                ethFormField(context, mqueryHeight(context, .05),
                    mqueryWidth(context, 1),
                    containercolor: Color(0xffA09696).withOpacity(.1),
                    showRadius: true,
                    showBorder: false,
                    onT: () {
                      setState(() {
                        Provider.of<validationBloc>(context, listen: false)
                            .validFullName = true;
                      });
                    },
                    controller: fullname,
                    radiusborder: true,
                    validator: (x) {
                      _checkFullName(x!);
                    }),
                sbHeight(mqueryHeight(context, .005)),
                !Provider.of<validationBloc>(context, listen: false)
                        .validFullName
                    ? _errorhandler(fullNameValidation)
                    : eText1("", 0),
                sbHeight(mqueryHeight(context, .03)),
                eText1("Email Address", mqueryHeight(context, .017),
                    color: ethcolor.headingblack, fontweight: FontWeight.w600),
                sbHeight(mqueryHeight(context, .01)),
                ethFormField(context, mqueryHeight(context, .05),
                    mqueryWidth(context, 1),
                    containercolor: Color(0xffA09696).withOpacity(.1),
                    showRadius: true,
                    showBorder: false, onT: () {
                  setState(() {
                    Provider.of<validationBloc>(context, listen: false)
                        .validEmail = true;
                  });
                }, controller: email, radiusborder: true),
                sbHeight(mqueryHeight(context, .005)),
                !Provider.of<validationBloc>(context, listen: false).validEmail
                    ? _errorhandler(emailValidation)
                    : eText1("", 0),
                sbHeight(mqueryHeight(context, .03)),
                eText1("Password", mqueryHeight(context, .017),
                    color: ethcolor.headingblack, fontweight: FontWeight.w600),
                sbHeight(mqueryHeight(context, .01)),
                ethFormField(
                  context,
                  mqueryHeight(context, .05),
                  mqueryWidth(context, 1),
                  containercolor: Color(0xffA09696).withOpacity(.1),
                  showRadius: true,
                  showBorder: false,
                  onT: () {
                    setState(() {
                      Provider.of<validationBloc>(context, listen: false)
                          .validPassword = true;
                    });
                  },
                  radiusborder: true,
                  controller: password,
                ),
                sbHeight(mqueryHeight(context, .005)),
                !Provider.of<validationBloc>(context, listen: false)
                        .validPassword
                    ? _errorhandler(passValidation)
                    : eText1("", 0),
                sbHeight(mqueryHeight(context, .03)),
                eText1("Use at least 8 characters,1 number & 1 uppercase",
                    mqueryHeight(context, .015),
                    color: Color(0xffF95959)),
                sbHeight(mqueryHeight(context, .03)),
                straightButton("Lets go", mqueryHeight(context, .06),
                    mqueryWidth(context, 1), ethcolor.primaryColor, 30,
                    fontColor: ethcolor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: mqueryHeight(context, .018), onT: () {
                  _callProceed();
                  // setState(() {
                  //   isLoading = true;
                  // });
                  // if (_formKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Processing Data')),
                  //   );
                  // }
                  // ;
                  //   _createCst();
                  //mynextScreen(context, Verify());
                }),
                sbHeight(mqueryHeight(context, .04)),
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
                sbHeight(mqueryHeight(context, .04)),
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
      ),
    );
  }

  _errorhandler(String error) {
    return eText1(error, mqueryHeight(context, .015), color: Color(0xffF95959));
  }

  _createCst() {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = true;
    });

    Provider.of<AccountServices>(context, listen: false)
        .createCustomer(email.text, password.text, fullname.text)
        .then((value) => xOutput(value));
  }

  xOutput(String x) {
    print(x);
    var bodyT = jsonDecode(x);
    bodyT["code"] == 201 ? xSuccess(bodyT) : xFailed(bodyT);
  }

  xSuccess(dynamic x) {
    setState(() {
      Provider.of<AccountServices>(context, listen: false).isLoading = false;
    });
    mynextScreen(
        context,
        Verify(
          email: email.text,
        ));

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

  _checkFullName(String x) {
    if (x.isEmpty) {
      return "Field can not be empty";
    }
  }

  _validateFullName() {
    if (fullname.text.isEmpty) {
      setState(() {
        Provider.of<validationBloc>(context, listen: false).validFullName =
            false;
        fullNameValidation = "Fullname can not be empty";
      });
    } else {
      setState(() {
        Provider.of<validationBloc>(context, listen: false).validFullName =
            true;
      });
    }
  }

  _validateEmail() {
    RegExp xRegex = RegExp(
        Provider.of<validationBloc>(context, listen: false).emailValidation);
    if (!xRegex.hasMatch(email.text) && !email.text.isEmpty) {
      setState(() {
        emailValidation = "Please enter a valid email";
        Provider.of<validationBloc>(context, listen: false).validEmail = false;
      });
    } else if (email.text.length <= 11 && !email.text.isEmpty) {
      setState(() {
        emailValidation = "Please enter a valid email";
        Provider.of<validationBloc>(context, listen: false).validEmail = false;
      });
    } else if (email.text.isEmpty) {
      setState(() {
        emailValidation = "Email cant be empty";
        Provider.of<validationBloc>(context, listen: false).validEmail = false;
      });
    } else {
      setState(() {
        Provider.of<validationBloc>(context, listen: false).hideKey(context);
        Provider.of<validationBloc>(context, listen: false).validEmail = true;
      });
    }
  }

  _validatePassword() {
    RegExp xRegexPass = RegExp(
        Provider.of<validationBloc>(context, listen: false).regexPassword);
    if (xRegexPass.hasMatch(password.text) &&
        !password.text.isEmpty &&
        password.text.length >= 8) {
      setState(() {
        passValidation = "Password must contain alphanumeric characters";
        Provider.of<validationBloc>(context, listen: false).validPassword =
            false;
      });
    } else if (password.text.length < 8 && !password.text.isEmpty) {
      setState(() {
        passValidation = "Password must be at least 8 characters";
        Provider.of<validationBloc>(context, listen: false).validPassword =
            false;
      });
    } else if (password.text.isEmpty) {
      setState(() {
        passValidation = "Password cant be empty";
        Provider.of<validationBloc>(context, listen: false).validPassword =
            false;
      });
    } else {
      setState(() {
        Provider.of<validationBloc>(context, listen: false).hideKey(context);
        Provider.of<validationBloc>(context, listen: false).validPassword =
            true;
      });
    }
  }

  _callProceed() {
    _validateFullName();
    _validateEmail();
    _validatePassword();
    Provider.of<validationBloc>(context, listen: false).validFullName &&
            Provider.of<validationBloc>(context, listen: false).validEmail &&
            Provider.of<validationBloc>(context, listen: false).validPassword
        ? _createCst()
        : null;
  }
}
