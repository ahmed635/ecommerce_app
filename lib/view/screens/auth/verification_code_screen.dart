import 'package:ecommerce_app/controller/auth/verification_code_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_button.dart';
import 'package:ecommerce_app/view/widgets/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  static const String routeName = "/verification_code_screen";

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(VerificationCodeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        elevation: 0,
        title: Text(
          "verification_code".tr,
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
            OtpTextField(
              showFieldAsBox: true,
              numberOfFields: 5,
              fieldWidth: 50,
              borderColor: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                controller.navigateToResetPassword();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: "verify".tr,
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Text(
                "resend_code".tr,
                style: TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                controller.navigateToResetPassword();
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
        "verification_code_description".tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Text buildTitleWidget(BuildContext context) {
    return Text(
      "verification_code_title".tr,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
