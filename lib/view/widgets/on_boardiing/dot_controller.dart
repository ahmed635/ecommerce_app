import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImpp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
            (index) => AnimatedContainer(
              duration: const Duration(microseconds: 800),
              margin: const EdgeInsets.only(right: 5),
              width: controller.currentPage == index ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
