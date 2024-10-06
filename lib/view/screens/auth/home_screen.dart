import 'package:ecommerce_app/controller/auth/home_controller.dart';
import 'package:ecommerce_app/view/widgets/home/categories_list_view.dart';
import 'package:ecommerce_app/view/widgets/home/custom_app_bar.dart';
import 'package:ecommerce_app/view/widgets/home/custom_offer_list_view.dart';
import 'package:ecommerce_app/view/widgets/home/custom_offer_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../widgets/home/custom_card_offer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = "/home_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeControllerImpl>(
          builder: (controller) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children:  [
                    CustomAppBar(
                      title: "Search",
                      onPressedIcon: (){},
                      onPressedSearch: (){},
                    ),
                    const CustomCardOffer(
                      offerTitle: "A Summer Surprise",
                      offerDescription: "Cashback 20%",
                    ),
                    const CategoriesListView(),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomOfferTitle(),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomOfferListView()
                  ],
                ),
              )),
    );
  }
}
