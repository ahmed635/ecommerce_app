import 'package:ecommerce_app/controller/home/home_page_controller.dart';
import 'package:ecommerce_app/model/categorites_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesListView extends GetView<HomePageControllerImpl> {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: FutureBuilder(
        future: controller.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return CategoryWidget(
                categoryModel: controller.categories[index],
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryWidget extends GetView<HomePageControllerImpl> {
  final CategoryModel categoryModel;
  final int? index;

  const CategoryWidget(
      {super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.navigateToItemsScreen(controller.categories, index!);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)),
            child: Image.network("${categoryModel.image}"),
          ),
          Text(
            "${categoryModel.nameEn}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
          )
        ],
      ),
    );
  }
}
