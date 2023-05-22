import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

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
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/auth/verify.dart';
import 'package:etuition/screens/prehome/courses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountServices extends ChangeNotifier {
  String account = "";
  bool isLoading = false;
  bool isHeader = false;
  String status = "";
  String BaseUrl = "https://2qdwjtxyv2.execute-api.us-east-2.amazonaws.com/dev";
  String accept = "Accept";
  String cType = "Content-Type";
  String xAccept = "application/json";
  String xContent = "application/json";
  String signUp = "/api/auth//auth/register";
  String verify = "/api/auth//auth/verify";
  String resend = "/api/auth//auth/resend-verification";
  String reset = "/api/auth//auth/reset-password";
  String login = "/api/auth//auth/login";
  String validatereset = "api/auth/validate-reset-password";

  Future<String> createCustomer(
      String email, String password, String firstName) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var xData = <String, dynamic>{
        "email": email,
        "password": password,
        "firstName": firstName,
      };
      var url = Uri.parse(BaseUrl + signUp);
      final xResponse = await http.post(url,
          body: jsonEncode(xData), headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> verifyOtp(String token, String email) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var xData = <String, dynamic>{
        "token": token,
        "email": email,
      };
      print(xData);
      var url = Uri.parse(BaseUrl + verify);
      final xResponse = await http.post(url,
          body: jsonEncode(xData), headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> loginUser(String email, String password) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var xData = <String, dynamic>{
        "email": email,
        "password": password,
      };
      print(xData);
      var url = Uri.parse(BaseUrl + login);
      final xResponse = await http.post(url,
          body: jsonEncode(xData), headers: sessionHeaders);
      print(url);

      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> resendOtp(String email) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var xData = <String, dynamic>{
        "email": email,
      };
      print(xData);
      var url = Uri.parse(BaseUrl + resend);
      final xResponse = await http.post(url,
          body: jsonEncode(xData), headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> resetPassword(String email) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var xData = <String, dynamic>{
        "email": email,
      };
      print(xData);
      var url = Uri.parse(BaseUrl + reset);
      final xResponse = await http.post(url,
          body: jsonEncode(xData), headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> validateresetPassword(
      String email, String token, String password) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var xData = <String, dynamic>{
        "email": email,
        "token": token,
        "password": password,
      };
      print(xData);
      var url = Uri.parse(BaseUrl + validatereset);
      final xResponse = await http.post(url,
          body: jsonEncode(xData), headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }
}
