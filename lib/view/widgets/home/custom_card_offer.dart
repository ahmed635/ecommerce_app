import 'package:ecommerce_app/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_page_controller.dart';
import '../../../core/constants/app_color.dart';

class CustomCardOffer extends GetView<HomePageControllerImpl> {
  const CustomCardOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchCurrentOffer(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return OfferWidget(offerModel: controller.currentOffer);
      },
    );
  }
}

class OfferWidget extends StatelessWidget {
  final OfferModel offerModel;

  const OfferWidget({super.key, required this.offerModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(
              "${offerModel.titleEn}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              "${offerModel.descriptionEn}",
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(150),
            ),
          ),
        )
      ]),
    );
  }
}
