import 'package:ecommerce_app/core/utils/message_utils.dart';
import 'package:ecommerce_app/data/data_source/remote/auth/user_utils.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();

  signUpWithGoogle();

  navigateToLoginPage();

  toggleShowPassword();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool showPassword = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  signUp() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        User? user = await UserUtils.createUser(
            email.text, password.text, username.text, phone.text);
        await UserUtils.sendEmailVerificationMessage(user);
        MessageUtils.success("Done", "Successful Sign Up");
        navigateToLoginPage();
      } catch (e) {
        MessageUtils.error("Sign Up Failed", "$e");
      }
    }
  }

  @override
  navigateToLoginPage() {
    Get.offNamed(LoginScreen.routeName);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  toggleShowPassword() {
    showPassword = !showPassword;
    update();
  }

  @override
  void signUpWithGoogle() async {
    try {
      User? user = await UserUtils.signInWithGoogle();
      print("user: $user");
    } catch (e) {}
  }
}
