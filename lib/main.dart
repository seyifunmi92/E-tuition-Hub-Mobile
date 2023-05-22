import 'package:etuition/appservices/accountservices.dart';
import 'package:etuition/appservices/courseservices.dart';
import 'package:etuition/models/home.dart';
import 'package:etuition/providers/storage.dart';
import 'package:etuition/providers/validationbloc.dart';
import 'package:etuition/screens/auth/login.dart';
import 'package:etuition/screens/auth/verify.dart';
import 'package:etuition/screens/courses/courses.dart';
import 'package:etuition/screens/home/home.dart';
import 'package:etuition/screens/onboarding/splashscreen.dart';
import 'package:etuition/screens/prehome/prehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'apptheme/apptheme.dart';
import 'package:etuition/providers/functions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  runApp(ethLaunch());
}

class ethLaunch extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  static _ethLaunchState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ethLaunchState>();
  const ethLaunch({Key? key}) : super(key: key);

  @override
  State<ethLaunch> createState() => _ethLaunchState();
}

class _ethLaunchState extends State<ethLaunch> {
  ThemeMode myTheme = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: ethLaunch.themeNotifier,
        builder: (_, ThemeMode x, __) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProviderBloc>(
                  create: (context) => ProviderBloc()),
              ChangeNotifierProvider<AccountServices>(
                  create: (context) => AccountServices()),
              ChangeNotifierProvider<validationBloc>(
                  create: (context) => validationBloc()),
              ChangeNotifierProvider<storageBloc>(
                  create: (context) => storageBloc()),
                    ChangeNotifierProvider<courseServices>(
                  create: (context) => courseServices()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: ethLaunch.navKey,
                theme: AppTheme.lightMode,
                darkTheme: AppTheme.darkMode,
                themeMode: myTheme,
                home: SplashScreen()
                
                ),
          );
        });
  }

  void changeTheme(ThemeMode tmode) {
    setState(() {
      myTheme = tmode;
    });
  }
}
