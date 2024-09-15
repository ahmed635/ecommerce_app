import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();

  navigateToLoginPage();

  Future<void> createNewUser();

  toggleShowPassword();
}

class SignUpControllerImpl extends SignUpController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  bool showPassword = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  @override
  signUp() async {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      try {
        User? user = await createUser();
        await sendEmailVerificationMessage(user);
        navigateToLoginPage();
      } catch (e) {
        Get.snackbar(
          "Sign Up Failed",
          "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
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
  Future<User?> createNewUser() async {
    try {
      return await createUser();
    } catch (e) {
      print(e);
      Get.snackbar(
        "Email not verified",
        "Please verify your email before logging in.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
    return null;
  }

  Future<void> sendEmailVerificationMessage(User? user) async {
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      print("Verification email has been sent.");
    }
  }

  Future<User?> createUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text);
    User? user = userCredential.user;
    if (user != null) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .set({'username': username.text, 'phone': phone.text});
    }
    return user;
  }
}
