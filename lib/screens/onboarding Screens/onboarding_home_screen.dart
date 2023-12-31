// ignore_for_file: prefer_const_constructors

import 'package:achiever/screens/authentications/signupPage.dart';
import 'package:achiever/screens/onboarding%20Screens/onboardingScreen1.dart';
import 'package:achiever/screens/onboarding%20Screens/onboardingScreen2.dart';
import 'package:achiever/screens/onboarding%20Screens/onboardingScreen3.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/constants.dart';

class UnboardingPage extends GetView<WelcomeController> {
  const UnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF0CAE11),
      //backgroundColor: Color.fromRGBO(13, 91, 154, 1),
      body: Obx(
        () => SizedBox(
            width: 360.w,
            height: 780.w,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index) {
                    controller.changePage(index);
                  },
                  controller: PageController(
                    initialPage: 0,
                    keepPage: false,
                    viewportFraction: 1,
                  ),
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      
                      child: OnboardingScreenOne(),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      
                      child: OnboardingScreenTwo(),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: OnboardingScreenThree(),

                    ),
                  ],
                ),
                Positioned(
                  child: DotsIndicator(
                    position: controller.state.index.value.toInt(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: Colors.grey.shade400,
                        size: Size.square(10),
                        activeSize: Size(18.0, 9.0),
                        activeColor: Colors.black54,
                        activeShape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(5.sp),
                        )),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class WelcomeController extends GetxController {
  WelcomeController();
  //final title = "ChatWave";
  final state = WelcomeState();

  changePage(int index) {
    state.index.value = index;
  }
}

class WelcomeState {
  var index = 0.obs;
}
