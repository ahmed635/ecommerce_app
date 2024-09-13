import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/core/localizations/change_localization.dart';
import 'package:ecommerce_app/view/screens/on_boarding_screen.dart';
import 'package:ecommerce_app/view/widgets/auth/logo.dart';
import 'package:ecommerce_app/view/widgets/language/custom_button_language.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends GetView<LocalController> {
  static const String routeName = "/change_language";

  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(),
              Text(
                "choose_language".tr,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButtonLanguage(
                textButton: "ar".tr,
                onPressed: () {
                  controller.changeLang("ar");
                  Get.toNamed(OnBoardingScreen.routeName);
                },
              ),
              // const SizedBox(height: 10,),
              CustomButtonLanguage(
                textButton: "en".tr,
                onPressed: () {
                  controller.changeLang("en");
                  Get.toNamed(OnBoardingScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
