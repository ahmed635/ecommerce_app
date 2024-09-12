import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_button.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static const String routeName = "/forget_password_screen";

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Text(
          "forget_password".tr,
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
            const LogoWidget(),
            const SizedBox(
              height: 20,
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
            CustomButton(
              text: "check".tr,
              onPressed: () {
                controller.navigateToVerificationCode();
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
        "forget_password_description".tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Text buildTitleWidget(BuildContext context) {
    return Text(
      "forget_password_title".tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
