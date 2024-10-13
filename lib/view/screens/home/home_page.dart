import 'package:ecommerce_app/controller/home/home_page_controller.dart';
import 'package:ecommerce_app/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/home/categories_list_view.dart';
import '../../widgets/home/custom_card_offer.dart';
import '../../widgets/home/items_list_view.dart';
import '../../widgets/home/custom_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImpl>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all( 15),
        child: ListView(
          children: [
            CustomAppBar(
              title: "Search",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const CustomCardOffer(),
            const CustomTitle(
              titleText: "Categories",
            ),
            const CategoriesListView(),
            const CustomTitle(titleText: "Shop Today's Deal"),
            const ItemsListView(),
            const CustomTitle(titleText: "Products For You"),
            const ItemsListView()
          ],
        ),
      ),
    );
  }
}
