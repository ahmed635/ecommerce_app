import 'package:ecommerce_app/data/data_source/remote/firestore/firestore_utils.dart';
import 'package:ecommerce_app/view/screens/admin/Category/Category_list_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/categorites_model.dart';

abstract class AddCategoryController extends GetxController {
  navigateToCategoryListView();

  addCategory();

  fetchCategories();

  updateCategory();

  deleteCategory();
}

class AddCategoryControllerImpl extends AddCategoryController {
  late final TextEditingController nameAr;
  late final TextEditingController nameEn;
  late final String? image;
  GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: "addCategory");

  @override
  void onInit() {
    // TODO: initialize all TextEditingController variables
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: dispose all TextEditingController variables
    super.dispose();
  }

  @override
  navigateToCategoryListView() {
    Get.toNamed(CategoryListViewScreen.routeName);
  }

  @override
  addCategory() async {
    // TODO: crate Category model object and pass it to addCategory method and create validator method
    CategoryModel categoryModel = CategoryModel();
    await FirestoreUtils.addCategory(categoryModel);
  }

  @override
  fetchCategories() {
    // TODO: fetch categories and show them to user to choose one
    throw UnimplementedError();
  }

  @override
  updateCategory() {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  deleteCategory() {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }
}
