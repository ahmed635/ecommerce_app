import 'package:ecommerce_app/core/services/gmail_services_utils.dart';
import 'package:ecommerce_app/view/screens/auth/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerificationCodeController extends GetxController {
  checkMatchedVerificationCode();

  navigateToResetPassword();

  Future<void> sendVerificationCode(String email);

  notVerifiedEmailMessage();
}

class VerificationCodeControllerImpl extends VerificationCodeController {
  String generatedCode = "";
  String code = "";
  String email = "";

  @override
  navigateToResetPassword() {
    Get.offNamed(ResetPasswordScreen.routeName);
  }

  @override
  checkMatchedVerificationCode() {
    // TODO: implement VerificationCode
    throw UnimplementedError();
  }

  @override
  Future<void> sendVerificationCode(String email) async {
    try {
      generatedCode = GmailServicesUtils.generateVerificationCode();
      await GmailServicesUtils.sendVerificationCode(email, generatedCode);
      notVerifiedEmailMessage();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to send verification code. Error: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  @override
  void notVerifiedEmailMessage() {
    Get.snackbar(
      "Verification code",
      "Please check your email for verification code",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    sendVerificationCode(email);
    super.onInit();
  }
}
