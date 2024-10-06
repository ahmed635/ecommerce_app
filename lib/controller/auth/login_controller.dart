import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/core/utils/firebase_utils.dart';
import 'package:ecommerce_app/core/utils/message_utils.dart';
import 'package:ecommerce_app/view/screens/auth/forget_password_screen.dart';
import 'package:ecommerce_app/view/screens/auth/home_screen.dart';
import 'package:ecommerce_app/view/screens/auth/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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
  MyServices myServices = Get.put(MyServices());

  @override
  login() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        UserCredential userCredential =
            await FirebaseUtils.signInWithEmailAndPassword(
                email.text, password.text);
        User? user = userCredential.user;
        if (user != null) {
          await user.reload();
          user.emailVerified
              ? navigateToHomePage()
              : MessageUtils.error("Email not verified",
                  "Please verify your email before logging in.");
        }
      } catch (e) {
        MessageUtils.error("Log In Failed", "$e");
      }
    }
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
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("token: $token");
    });
    email = TextEditingController();
    password = TextEditingController();
    myServices.pref.setBool("should_not_show_on_boarding_screen", true);
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
