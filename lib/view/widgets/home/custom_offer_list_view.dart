import 'package:ecommerce_app/controller/home/home_page_controller.dart';
import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOfferListView extends GetView<HomePageControllerImpl> {
  const CustomOfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: FutureBuilder(
        future: controller.fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              OfferDetailsWidget(item: controller.items[index]),
        );
        },
      ),
    );
  }
}

class OfferDetailsWidget extends StatelessWidget {
  ItemModel? item;

  OfferDetailsWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.all(10),
          child: Image.network(
            "${item?.image}",
            width: 150,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          height: 120,
          width: 200,
          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(.2),
              borderRadius: BorderRadius.circular(20)),
        ),
        Center(
          child: SizedBox(
            height: 120,
            width: 200,
            child: Column(
              children: [
                Text(
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  "${item!.nameEn}",
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 6),
                  decoration: BoxDecoration(
                      color: Colors.red[600],
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "${item!.discount}% off",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
