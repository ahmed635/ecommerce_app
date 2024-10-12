import 'package:ecommerce_app/controller/on_boarding/on_boarding_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImpp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: buildContinueButton(),
        ),
        buildSkipButton(),
      ],
    );
  }

  MaterialButton buildContinueButton() {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
      textColor: Colors.white,
      onPressed: () {
        controller.next();
      },
      child: Text(
        "continue".tr,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  MaterialButton buildSkipButton() {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
      onPressed: () {
        controller.skip();
      },
      child: Text(
        "skip".tr,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
