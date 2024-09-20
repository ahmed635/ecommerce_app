import 'package:ecommerce_app/core/utils/email_utils.dart';
import 'package:ecommerce_app/core/utils/message_utils.dart';
import 'package:ecommerce_app/view/screens/auth/reset_password_screen.dart';
import 'package:get/get.dart';

abstract class VerificationCodeController extends GetxController {
  checkMatchedVerificationCode(String code);

  navigateToResetPassword();

  Future<void> sendVerificationCode(String email);
}

class VerificationCodeControllerImpl extends VerificationCodeController {
  String generatedCode = "";
  String email = "";

  @override
  navigateToResetPassword() {
    Get.offNamed(ResetPasswordScreen.routeName);
  }

  @override
  checkMatchedVerificationCode(String code) {
    if (generatedCode == code) {
      navigateToResetPassword();
    } else {
      MessageUtils.error(
        "Wrong Code",
        "The entered verified code is incorrect",
      );
    }
  }

  @override
  Future<void> sendVerificationCode(String email) async {
    try {
      generatedCode = EmailUtils.generateVerificationCode();
      await EmailUtils.sendVerificationCode(email, generatedCode);
      MessageUtils.info(
          "Verification code", "Please check your email for verification code");
    } catch (e) {
      MessageUtils.error(
          "Failed to send verification code", "Error: $e");
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    sendVerificationCode(email);
    super.onInit();
  }
}
