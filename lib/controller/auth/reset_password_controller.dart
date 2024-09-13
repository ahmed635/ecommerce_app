import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  checkPasswordConfirmation();

  navigateToLoginPage();

  toggleShowConfirmPassword();

  toggleShowPassword();
}

class ResetPasswordControllerImpl extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController confirmedPassword;
  bool showPassword = true;
  bool showConfirmPassword = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  navigateToLoginPage() {
    Get.offNamed(LoginScreen.routeName);
  }

  @override
  checkPasswordConfirmation() {
    var data = key.currentState;
    if (data!.validate() && password.text == confirmedPassword.text) {
      print("valid");
      navigateToLoginPage();
    } else {
      print("Not Valid");
    }
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

  @override
  toggleShowConfirmPassword() {
    showConfirmPassword = !showConfirmPassword;
    update();
  }

  @override
  toggleShowPassword() {
    showPassword = !showPassword;
    update();
  }
}
