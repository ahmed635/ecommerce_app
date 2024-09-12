import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_button.dart';
import 'package:ecommerce_app/view/widgets/auth/login_or_signup_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String routeName = "/sign_up_screen";

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Text(
          "sign_up".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: ListView(
          children: [
            buildTitleWidget(context),
            const SizedBox(
              height: 10,
            ),
            buildBodyText(context),
            const SizedBox(
              height: 35,
            ),
            CustomTextFormField(
              hintText: "username_description".tr,
              labelText: "username".tr,
              iconData: Icons.person_outlined,
              controller: controller.username,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: "email_description".tr,
              labelText: "email".tr,
              iconData: Icons.email_outlined,
              controller: controller.email,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: "phone_description".tr,
              labelText: "phone".tr,
              iconData: Icons.phone_android_outlined,
              controller: controller.phone,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              hintText: "password_description".tr,
              labelText: "password".tr,
              iconData: Icons.lock_outline,
              controller: controller.password,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: "sign_up".tr,
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            LoginOrSignUpText(
              textOne: "have_account".tr,
              textTwo: "sign_in".tr,
              onTap: () {
                controller.navigateToLoginPage();
              },
            )
          ],
        ),
      ),
    );
  }

  Container buildBodyText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "sign_up_description".tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Text buildTitleWidget(BuildContext context) {
    return Text(
      "sign_up_title".tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
