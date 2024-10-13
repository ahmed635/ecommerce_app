import 'package:ecommerce_app/controller/admin/item/item_list_view_controller.dart';
import 'package:ecommerce_app/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemListViewScreen extends StatelessWidget {
  static const String routeName = "/item_list_view_screen";

  const ItemListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemListViewControllerImpl>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Item List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.navigateToItemScreen();
              },
            ),
          ],
        ),
        body: Obx(() {
          return FutureBuilder(
            future: controller.fetchItems(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ItemCard(item: controller.items[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: controller.items.length);
            },
          );
        }),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  ItemModel item;

  ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: build the item card widget and show all item data to user
    return const Placeholder();
  }
}
