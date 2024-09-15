import 'package:ecommerce_app/view/screens/auth/forget_password_screen.dart';
import 'package:ecommerce_app/view/screens/auth/home_screen.dart';
import 'package:ecommerce_app/view/screens/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();

  navigateToForgetPassword();

  navigateToSignUP();

  toggleShowPassword();

  navigateToHomePage();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  bool showPassword = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  login() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        UserCredential userCredential = await signInWithEmailAndPassword();
        User? user = userCredential.user;
        if (user != null) {
          await user.reload();
          user.emailVerified ? navigateToHomePage() : notVerifiedEmailMessage();
        }
      } catch (e) {
        print("Login error: $e");
      }
    }
  }

  Future<UserCredential> signInWithEmailAndPassword() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
  }

  void notVerifiedEmailMessage() {
    Get.snackbar(
      "Email not verified",
      "Please verify your email before logging in.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
      colorText: Colors.white,
    );
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

  @override
  void toggleShowPassword() {
    showPassword = !showPassword;
    update();
  }

  @override
  void navigateToHomePage() {
    Get.offNamed(HomeScreen.routeName);
  }
}
