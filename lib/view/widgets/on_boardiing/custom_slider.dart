import 'package:ecommerce_app/controller/on_boarding_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/data/data_source/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImpp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                buildTitleWidget(i),
                const SizedBox(height: 80),
                buildImageWidget(i),
                const SizedBox(height: 60),
                buildBodyWidget(i),
              ],
            ));
  }

  Container buildBodyWidget(int i) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          onBoardingList[i].body!,
          style: TextStyle(
              height: 2.5,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18),
          textAlign: TextAlign.center,
        ));
  }

  Image buildImageWidget(int i) {
    return Image.asset(
      onBoardingList[i].image!,
      width: 200,
      height: 300,
      fit: BoxFit.fill,
    );
  }

  Text buildTitleWidget(int i) {
    return Text(
      "${onBoardingList[i].title}",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}
