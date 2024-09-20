import 'package:ecommerce_app/core/utils/message_utils.dart';
import 'package:ecommerce_app/view/screens/auth/verification_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  navigateToVerificationCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController email;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  navigateToVerificationCode() {
    Get.toNamed(VerificationCodeScreen.routeName,
        arguments: {"email": email.text});
  }

  @override
  checkEmail() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        List<String> signInMethod =
            await FirebaseAuth.instance.fetchSignInMethodsForEmail(email.text);
        if (signInMethod.isEmpty) {
          // TODO:error not work correctly but this for test verification code sender
          navigateToVerificationCode();
        } else {
          MessageUtils.error(
              "Email Not Found", "The email ${email.text} is not registered.");
        }
      } catch (e) {
        MessageUtils.error("Error", "$e");
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
