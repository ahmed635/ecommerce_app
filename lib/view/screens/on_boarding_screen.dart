import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/view/widgets/on_boardiing/custom_button.dart';
import 'package:ecommerce_app/view/widgets/on_boardiing/custom_slider.dart';
import 'package:ecommerce_app/view/widgets/on_boardiing/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/on_boarding_screen";

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImpp());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: SafeArea(
          child: Column(
            children: [
              const Expanded(
                flex: 3,
                child: CustomSliderOnBoarding(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: const [
                    CustomDotControllerOnBoarding(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButtonOnBoarding(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
