import 'package:ecommerce_app/view/screens/auth/verification_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  navigateToVerificationCode();

  emailNotRegisteredMessage();
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
        if (signInMethod.isEmpty) { // error not work correctly but this for test verification code sender
          navigateToVerificationCode();
        } else {
          emailNotRegisteredMessage();
        }
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  void emailNotRegisteredMessage() {
    Get.snackbar(
      "Email Not Found",
      "The email ${email.text} is not registered.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
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
