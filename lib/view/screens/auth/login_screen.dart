import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_button.dart';
import 'package:ecommerce_app/view/widgets/auth/login_or_signup_text.dart';
import 'package:ecommerce_app/view/widgets/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/auth/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login_screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Text(
          "sign_in".tr,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: ListView(
          children: [
            const LogoWidget(),
            const SizedBox(
              height: 15,
            ),
            buildTitleWidget(context),
            const SizedBox(
              height: 10,
            ),
            buildBodyText(context),
            const SizedBox(
              height: 35,
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
              hintText: "password_description".tr,
              labelText: "password".tr,
              iconData: Icons.lock_outline,
              controller: controller.password,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Text(
                "forget_password".tr,
                textAlign: TextAlign.end,
                style: TextStyle(color: AppColor.primaryColor),
              ),
              onTap: () {
                controller.navigateToForgetPassword();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              text: "sign_in".tr,
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            LoginOrSignUpText(
              textOne: "do_not_have_account".tr,
              textTwo: "sign_up".tr,
              onTap: () {
                controller.navigateToSignUP();
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
        "sign_in_description".tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Text buildTitleWidget(BuildContext context) {
    return Text(
      "sign_in_title".tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
