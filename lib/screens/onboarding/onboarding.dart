import 'package:carousel_slider/carousel_slider.dart';
import 'package:etuition/assetfile/imageclass.dart';
import 'package:etuition/constant/colors.dart';
import 'package:etuition/hooks/buttons/button.dart';
import 'package:etuition/hooks/containers/onboardingstack.dart';
import 'package:etuition/hooks/layout/mediaqueries.dart';
import 'package:etuition/hooks/text/textwidget.dart';
import 'package:etuition/models/onboarding.dart';
import 'package:etuition/navigators/navigations.dart';
import 'package:etuition/providers/functions.dart';
import 'package:etuition/screens/auth/createaccount.dart';
import 'package:etuition/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int imageIndex = 0;

  final myController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFFFD),
      body: Stack(children: [
        CarouselSlider.builder(
            carouselController: myController,
            itemCount: onboardingSlides.length,
            itemBuilder: (context, index, realIndex) =>
                onboardingStack(context, onboardingSlides[index]),
            options: CarouselOptions(
                viewportFraction: 1,
                height: mqueryHeight(context, 1),
                onPageChanged: (index, reason) {
                  setState(() {
                    imageIndex = index;
                  });
                })),
        Scaffold(
          backgroundColor: ethcolor.transparent,
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: mqueryWidth(context, .04)),
            child: Column(
              children: [
                sbHeight(mqueryHeight(context, .58)),
                pageIndicator(context, imageIndex,
                    color: ethcolor.primaryColor,
                    color2: ethcolor.primaryColor.withOpacity(.4)),
                sbHeight(mqueryHeight(context, .235)),
                straightButton(
                    imageIndex != 2 ? "Next" : "Get Started",
                    mqueryHeight(context, .06),
                    mqueryWidth(context, 1),
                    ethcolor.primaryColor,
                    30,
                    fontColor: ethcolor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: mqueryHeight(context, .018), onT: () {
                  imageIndex != 2
                      ? nextSlide()
                      : mynextScreen(context, CreateAccount());
                }),
                sbHeight(mqueryHeight(context, .02)),
                straightButton(
                    imageIndex != 2 ? "Skip" : "Login",
                    mqueryHeight(context, .055),
                    mqueryWidth(context, 1),
                    imageIndex != 2
                        ? ethcolor.transparent
                        : ethcolor.primaryColor,
                    30,
                    fontColor: imageIndex != 2
                        ? ethcolor.primaryColor
                        : ethcolor.white,
                    fontWeight:
                        imageIndex != 2 ? FontWeight.w400 : FontWeight.w600,
                    fontSize: mqueryHeight(context, .018), onT: () {
                  mynextScreen(
                      context, imageIndex != 2 ? CreateAccount() : Login());
                }),
              ],
            ),
          ),
        )
      ]),
    );
  }

  nextSlide() {
    myController.nextPage();
  }
}
