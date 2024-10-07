import 'package:ecommerce_app/controller/auth/home_controller.dart';
import 'package:ecommerce_app/view/widgets/home/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categories_list_view.dart';
import 'custom_card_offer.dart';
import 'custom_offer_list_view.dart';
import 'home_screen_title.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            CustomAppBar(
              title: "Search",
              onPressedIcon: () {},
              onPressedSearch: () {},
            ),
            const CustomCardOffer(
              offerTitle: "A Summer Surprise",
              offerDescription: "Cashback 20%",
            ),
            const HomeScreenTitle(
              titleText: "Categories",
            ),
            const CategoriesListView(),
            const HomeScreenTitle(titleText: "Shop Today's Deal"),
            const CustomOfferListView(),
            const HomeScreenTitle(titleText: "Products For You"),
            const CustomOfferListView()
          ],
        ),
      ),
    );
  }
}
