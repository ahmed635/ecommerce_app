import 'package:ecommerce_app/view/screens/auth/forget_password_screen.dart';
import 'package:ecommerce_app/view/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();

  navigateToForgetPassword();

  navigateToSignUP();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  navigateToForgetPassword() {
    Get.toNamed(ForgetPasswordScreen.routeName);
  }

  @override
  navigateToSignUP() {
    Get.offNamed(SignUpScreen.routeName);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
