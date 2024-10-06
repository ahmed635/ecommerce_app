import 'package:ecommerce_app/controller/auth/forget_password_controller.dart';
import 'package:ecommerce_app/controller/auth/home_controller.dart';
import 'package:ecommerce_app/controller/auth/login_controller.dart';
import 'package:ecommerce_app/controller/auth/signup_controller.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginControllerImp(), fenix: true);
    Get.lazyPut(() => SignUpControllerImpl(), fenix: true);
    Get.lazyPut(() => ForgetPasswordControllerImpl(), fenix: true);
    Get.lazyPut(() => HomeControllerImpl(), fenix: true);
  }

}