import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/providers/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _splashFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ethcolor.secondColor,
      body: Center(
        child: Image.asset(
          ImageBloc.splash,
          height: mqueryHeight(context, .2),
        ),
      ),
    );
  }

  _splashFunction() {
    Provider.of<ProviderBloc>(context, listen: false).nextScreenSplash(context);
  }
}
