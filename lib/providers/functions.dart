import 'dart:async';
import 'dart:io';
import 'package:etuition/main.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProviderBloc extends ChangeNotifier {
  setDarkTheme(BuildContext context) {
    ethLaunch.of(context)!.changeTheme(ThemeMode.dark);
  }

  setLightTheme(BuildContext context) {
    ethLaunch.of(context)!.changeTheme(ThemeMode.light);
  }

  closeApp() {
    Platform.isAndroid ? SystemNavigator.pop() : exit(0);
  }

  timer(int duration, void Function()? function) {
    Timer(Duration(seconds: duration), function!);
  }

  nextScreenSplash(BuildContext context) {
    timer(5, () {
      mynextTransition(
          context, true, const Duration(seconds: 1), const Onboarding());
    });
  }
}
