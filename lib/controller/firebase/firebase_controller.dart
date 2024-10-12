import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/view/screens/home/home_screen.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class FirebaseController extends GetxController {
  currentUserState();

  navigateToHome();

  navigateToLogin();
}

class FirebaseControllerImpl extends FirebaseController {
  MyServices myServices = Get.find();

  @override
  currentUserState() {
    if (myServices.pref.getBool("should_not_show_on_boarding_screen") ??
        false) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          navigateToLogin();
        } else {
          navigateToHome();
        }
        print("current user $user");
      });
    }
  }

  @override
  void onInit() {
    currentUserState();
    super.onInit();
  }

  @override
  navigateToHome() {
    Get.offNamed(HomeScreen.routeName);
  }

  @override
  navigateToLogin() {
    Get.offNamed(LoginScreen.routeName);
  }
}
