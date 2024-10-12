import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/controller/home/home_page_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:ecommerce_app/controller/home/profile_page_controller.dart';
import 'package:get/get.dart';

import 'controller/home/home_screen_controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImpl(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImpl(), fenix: true);
    Get.lazyPut(() => HomePageControllerImpl(), fenix: true);
    Get.lazyPut(() => HomeScreenControllerImpl(), fenix: true);
    Get.lazyPut(() => ProfilePageControllerImpl(), fenix: true);
  }

}