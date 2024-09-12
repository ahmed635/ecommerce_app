import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkPasswordConfirmation();

  navigateToLoginPage();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirmedPassword;

  @override
  navigateToLoginPage() {
    Get.offNamed(LoginScreen.routeName);
  }

  @override
  checkPasswordConfirmation() {
    // TODO: implement ResetPassword
    throw UnimplementedError();
  }

  @override
  void onInit() {
    password = TextEditingController();
    confirmedPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmedPassword.dispose();
    super.dispose();
  }
}
