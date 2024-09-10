import 'package:ecommerce_app/controller/on_boarding_controller.dart';
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
                const SizedBox(height: 80),
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
          style: Theme.of(context).textTheme.bodyText1,
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

  Text buildTitleWidget(BuildContext context, int i) {
    return Text(
      "${onBoardingList[i].title}",
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
