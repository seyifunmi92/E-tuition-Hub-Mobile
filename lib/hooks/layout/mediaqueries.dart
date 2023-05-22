import 'package:flutter/material.dart';


mqueryHeight(BuildContext context ,double height){
  return MediaQuery.of(context).size.height * height;
}

mqueryWidth(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width;
}

totalWidth(BuildContext context) {
  MediaQuery.of(context).size.width;
}

sbHeight(double height) {
  return SizedBox(
    height: height,
  );
}

sbWidth(double width) {
  return SizedBox(
    width: width,
  );
}