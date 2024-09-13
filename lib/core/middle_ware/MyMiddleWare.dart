import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if(myServices.pref.getBool("should_not_show_on_boarding_screen") ?? false) {
      return const RouteSettings(name: LoginScreen.routeName);
    }
  }
}