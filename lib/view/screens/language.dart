import 'package:ecommerce_app/core/localizations/change_localization.dart';
import 'package:ecommerce_app/view/screens/on_boarding_screen.dart';
import 'package:ecommerce_app/view/widgets/language/custom_button_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocalController> {
  static const String routeName = "/change_language";
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Choose Language",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20,),
            CustomButtonLanguage(
              textButton: "Arabic",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(OnBoardingScreen.rootName);
              },
            ),
            // const SizedBox(height: 10,),
            CustomButtonLanguage(
              textButton: "English",
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(OnBoardingScreen.rootName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
