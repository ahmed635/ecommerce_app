import 'package:ecommerce_app/controller/admin/category/category_list_view_controller.dart';
import 'package:ecommerce_app/model/categorites_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListViewScreen extends StatelessWidget {
  static const String routeName = "/category_list_view_screen";

  const CategoryListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryListViewControllerImpl>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.navigateToCategoryScreen();
              },
            ),
          ],
        ),
        body: Obx(() {
          return FutureBuilder(
            future: controller.fetchCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return CategoryCard(
                        categoryModel: controller.categories[index]);
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemCount: controller.categories.length);
            },
          );
        }),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    // TODO: build the category card widget and show all item data to user
    return const Placeholder();
  }
}
