import 'package:ecommerce_app/core/utils/message_utils.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/user_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  sendPasswordResetEmail();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  sendPasswordResetEmail() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        await UserUtils.sendEmailRestPassword(email.text);
        MessageUtils.info("Check Your Email",
            "Password reset email was sent to ${email.text}");
      } catch (e) {
        MessageUtils.error("Failed to send password reset email", "$e");
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
