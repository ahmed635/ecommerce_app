import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();

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
  signUp() {
    var data = key.currentState;
    if (data!.validate()) {
      print("valid registration");
      navigateToLoginPage();
    } else {
      print("Not valid registration");
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
}
