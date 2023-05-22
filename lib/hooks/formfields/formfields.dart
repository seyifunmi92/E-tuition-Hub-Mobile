import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ethFormField(
  BuildContext context,
  double height,
  double width, {
  TextEditingController? controller,
  FocusNode? focus,
  Color? containercolor,
  Color? borderColor,
  bool showBorder = false,
  BorderRadius? radius,
  bool showRadius = false,
  void Function()? onEditComplete,
  void Function()? onT,
  void Function()? suffixFunction,
  bool showShadow = false,
  bool isReadonly = false,
  void Function(String)? onchanged,
  void Function(String)? onSubmit,
  String? Function(String?)? validator,
  bool? autofocus,
  bool radiusborder = false,
  Key? key,
  String? initial,
  bool showprefix = false,
  bool showSuffix = false,
  String? title,
  IconData? pIcon,
  int? maxlength,
  int? maxlines,
  bool isnext = true,
  bool isInt = false,
  bool isObscure = false,
  bool autocorrect = false,
  TextInputType? textType,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        border: showBorder
            ? Border.all(
                color: ethcolor.black.withOpacity(.4),
              )
            : null,
        color: containercolor,
        boxShadow: showShadow
            ? [
                const BoxShadow(
                  color: Colors.black12,
                  blurStyle: BlurStyle.normal,
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: Offset.zero,
                ),
              ]
            : null,
        borderRadius: showRadius ? BorderRadius.circular(10) : null),
    child: TextFormField(
      validator: validator,
      style: TextStyle(
        fontFamily: "BrfRegular",
        fontSize: mqueryHeight(context, .016),
        color: ethcolor.black.withOpacity(.5),
      ),
      onEditingComplete: onEditComplete,
      onChanged: onchanged,
      key: key,
      onTap: onT,
      readOnly: isReadonly ? true : false,
      initialValue: initial,
      focusNode: focus,
      onFieldSubmitted: onSubmit,
      controller: controller,
      maxLength: maxlength,
      maxLines: maxlines,
      autofocus: autofocus == true ? true : false,
      decoration: InputDecoration(
        prefixIcon: showprefix
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Icon(
                  pIcon,
                ),
              )
            : null,
        suffixIcon: showSuffix
            ? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: suffixFunction,
                  child: Icon(
                    pIcon,
                    size: 17,
                  ),
                ),
              )
            : null,
        counterText: "",
        border: InputBorder.none,
        focusedBorder: radiusborder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ethcolor.red.withOpacity(.5)),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(color: ethcolor.black.withOpacity(.3))),
        errorBorder: radiusborder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: ethcolor.black, style: BorderStyle.solid, width: 1))
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(
                    color: ethcolor.black, style: BorderStyle.solid, width: 1)),
        focusColor: ethcolor.red,
        hintText: title,
        hintStyle: TextStyle(
          fontFamily: "BrfRegular",
          fontSize: MediaQuery.of(context).size.height * .016,
          color: ethcolor.black.withOpacity(.3),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .03),
      ),
      textInputAction: isnext ? TextInputAction.next : TextInputAction.done,
      keyboardType: isInt ? TextInputType.number : TextInputType.emailAddress,
      obscureText: isObscure ? true : false,
    ),
  );

  
}


