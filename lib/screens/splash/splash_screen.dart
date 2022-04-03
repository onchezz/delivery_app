import 'dart:async';

import 'package:delivery_app/routes/route_helper.dart';
import 'package:delivery_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(Duration(seconds: 2), () => Get.offAllNamed(RouteHelper.initial));
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (animation.isDismissed) {
    //   Timer(Duration(seconds: 1), () => Get.offNamed(RouteHelper.initial));
    //   // Get.offNamed(RouteHelper.initial);
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: animation,
              child: Image.asset(
                'assets/image/logo part 1.png',
                width: Dimentions.splashImg,
                opacity: animation,
              ),
            ),
            Image.asset(
              'assets/image/logo part 2.png',
              width: Dimentions.splashImg,
            ),
          ],
        ),
      ),
    );
  }
}
