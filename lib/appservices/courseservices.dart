import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class courseServices extends ChangeNotifier {
  String account = "";
  bool isLoading = false;
  bool isHeader = false;
  String status = "";
  String accept = "Accept";
  String cType = "Content-Type";
  String xAccept = "application/json";
  String xContent = "application/json";
  String allCoursesx = "/api/courses/courses/categories";
  String getallcourses = "/api/courses/courses";
  String BaseUrl = "https://2t49pnat1b.execute-api.us-east-2.amazonaws.com/dev";

  Future<String> getAllCourseCategories() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var url = Uri.parse(BaseUrl + allCoursesx);
      print(sessionHeaders);
      print(url);
      final xResponse = await http.get(url, headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> getCourses() async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var url = Uri.parse(BaseUrl + getallcourses);
      print(sessionHeaders);
      print(url);
      final xResponse = await http.get(url, headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> getAllCoursebyidCategories(String id) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var url = Uri.parse(BaseUrl + "/api/courses/courses/categories/${id}");
      print(sessionHeaders);
      print(url);
      final xResponse = await http.get(url, headers: sessionHeaders);
      if (xResponse.statusCode == 200) {
        return xResponse.body;
      } else {
        return xResponse.body;
      }
    } on SocketException catch (xError) {
      return xError.message;
    }
  }

  Future<String> getSingleCourse(int id) async {
    SharedPreferences _shared = await SharedPreferences.getInstance();
    String? sessionID = _shared.getString("token");
    var sessionHeaders = <String, String>{
      HttpHeaders.authorizationHeader: isHeader ? "Bearer $sessionID" : "",
      accept: xAccept,
      cType: xContent,
    };
    try {
      var url = Uri.parse(BaseUrl + "/api/courses/courses/${id}");
      print(sessionHeaders);
      print(url);
      final xResponse = await http.get(url, headers: sessionHeaders);
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
