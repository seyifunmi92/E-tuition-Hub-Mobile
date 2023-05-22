import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class storageBloc extends ChangeNotifier {

  
  storeToken(String data) async {
    SharedPreferences x = await SharedPreferences.getInstance();
    var xx = x.setString("token", data);
  }

   setTime(String data) async {
    SharedPreferences x = await SharedPreferences.getInstance();
    var xx = x.setString("time", data);
  }

    setName(String data) async {
    SharedPreferences x = await SharedPreferences.getInstance();
    var xx = x.setString("name", data);
  }
}
