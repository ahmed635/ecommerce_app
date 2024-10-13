import 'package:ecommerce_app/controller/home/home_screen_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/home/custom_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {},
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBar(),
        body: controller.listPages.elementAt(controller.currentPage),
      ),
    );
  }
}
