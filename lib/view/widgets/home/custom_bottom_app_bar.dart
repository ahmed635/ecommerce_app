import 'package:ecommerce_app/controller/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_button_app_bar.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImpl>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Row(
          children: [
            ...List.generate(
              controller.listPages.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : HomeButtonAppBar(
                        title: controller.bottomAppBarTitles.elementAt(i),
                        onPressed: () {
                          controller.changePage(i);
                        },
                        icon: controller.bottomAppBarIcons.elementAt(i),
                        active: controller.currentPage == (i),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
