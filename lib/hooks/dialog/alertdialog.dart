import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


ethAlert(BuildContext context, String responseText,
    {bool editor = false, String? editedtext, Color? color = ethcolor.red}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: eText1(responseText, mqueryHeight(context, .019),
          fontweight: FontWeight.w400),
      actions: [
        CupertinoDialogAction(
          child: eText1(editor ? editedtext! : "Close", mqueryHeight(context, .019),
              color: color),
          onPressed: () {
            finish(context);
          },
        ),
      ],
    ),
  );
}