import 'package:ecommerce_app/controller/on_boarding/on_boarding_controller.dart';
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
                buildTitleWidget(context, i),
                const SizedBox(height: 70),
                buildImageWidget(i),
                const SizedBox(height: 60),
                buildBodyWidget(context, i),
              ],
            ));
  }

  Container buildBodyWidget(BuildContext context, int i) {
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          onBoardingList[i].body!,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ));
  }

  Image buildImageWidget(int i) {
    return Image.asset(
      onBoardingList[i].image!,
      width: 200,
      height: 250,
      fit: BoxFit.fill,
    );
  }

  Widget buildTitleWidget(BuildContext context, int i) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        "${onBoardingList[i].title}",
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
