import 'package:ecommerce_app/view/screens/auth/verification_code_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  navigateToVerificationCode();
}

class ForgetPasswordControllerImpl extends ForgetPasswordController {
  late TextEditingController email;

  @override
  navigateToVerificationCode() {
    Get.offNamed(VerificationCodeScreen.routeName);
  }

  @override
  checkEmail() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
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
