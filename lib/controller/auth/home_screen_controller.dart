import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/widgets/home/home_page.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImpl extends HomeScreenController {
  int currentPage = 0;
  List<String> bottomAppBarTitles = ["Home", "Settings", "Profile", "Favorite"];
  List<IconData> bottomAppBarIcons = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite
  ];
  List<Widget> listPages = [
    const HomePage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Settings"),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Profile"),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text("Favorite"),
        )
      ],
    ),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
