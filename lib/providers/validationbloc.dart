import 'dart:async';
import 'dart:io';
import 'package:etuition/main.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class validationBloc extends ChangeNotifier {
  hideKey(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  bool validFullName = true;
  bool validEmail = true;
  bool validPassword = true;
  String emailValidation =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String regexPassword = r'^[a-zA-Z0-9]+$';
}
