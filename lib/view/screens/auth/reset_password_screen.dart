import 'package:ecommerce_app/controller/auth/reset_password_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/core/functions/confirmed_password.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_button.dart';
import 'package:ecommerce_app/view/widgets/auth/custom_text_form_field.dart';
import 'package:ecommerce_app/view/widgets/auth/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  static const String routeName = "/reset_password_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white24,
          elevation: 0,
          title: Text(
            "reset_password".tr,
            style: Theme
                .of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<ResetPasswordControllerImpl>(
            builder: (controller) =>
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 35),
                  child: Form(
                    key: controller.key,
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
                          height: 20,
                        ),
                        CustomTextFormField(
                          validator: (val) {
                            return validInput(val, 3, 20, "password");
                          },
                          hintText: "password_description".tr,
                          obscureText: controller.showPassword,
                          onTapIcon: () {
                            controller.toggleShowPassword();
                          },
                          labelText: "password".tr,
                          iconData: Icons.lock_outline,
                          controller: controller.password,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomTextFormField(
                          validator: (val) {
                            return confirmedPassword(controller.password.text, val);
                          },
                          hintText: "confirm_password_description".tr,
                          labelText: "confirm_password".tr,
                          obscureText: controller.showConfirmPassword,
                          onTapIcon: () {
                            controller.toggleShowConfirmPassword();
                          },
                          iconData: Icons.lock_outline,
                          controller: controller.confirmedPassword,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: "reset_password".tr,
                          onPressed: () {
                            controller.checkPasswordConfirmation();
                          },
                        )
                      ],
                    ),
                  ),
                ),
          ),
        ));
  }

  Container buildBodyText(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "reset_password_description".tr,
        textAlign: TextAlign.center,
        style: Theme
            .of(context)
            .textTheme
            .bodyText2,
      ),
    );
  }

  Text buildTitleWidget(BuildContext context) {
    return Text(
      "reset_password_title".tr,
      textAlign: TextAlign.center,
      style: Theme
          .of(context)
          .textTheme
          .headline2,
    );
  }
}
