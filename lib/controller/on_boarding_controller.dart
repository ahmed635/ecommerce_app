import 'package:ecommerce_app/data/data_source/static/static.dart';
import 'package:ecommerce_app/view/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);

  skip();
}

class OnBoardingControllerImpp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;

  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length - 1) {
      Get.offAllNamed(LoginScreen.routeName);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  skip() {
    Get.offAllNamed(LoginScreen.routeName);
  }
}
