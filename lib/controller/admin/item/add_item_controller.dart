import 'package:ecommerce_app/data/data_source/remote/firestore/firestore_utils.dart';
import 'package:ecommerce_app/model/item_model.dart';
import 'package:ecommerce_app/view/screens/admin/item/item_list_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddItemController extends GetxController{
  navigateToItemListView();

  addItem();

  fetchCategories();

  updateItem();

  deleteItem();
}

class AddItemControllerImpl extends AddItemController{
  late final TextEditingController nameAr;
  late final TextEditingController nameEn;
  late final TextEditingController descriptionAr;
  late final TextEditingController descriptionEn;
  late final TextEditingController price;
  late final TextEditingController discount;
  late final TextEditingController tax;
  late final TextEditingController count;
  late final String? image;
  String? categoryId;
  GlobalKey<FormState> key = GlobalKey<FormState>(debugLabel: "addItem");

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
  navigateToItemListView() {
    Get.toNamed(ItemListViewScreen.routeName);
  }

  @override
  addItem() async{
    // TODO: crate item model object and pass it to addItem method and create validator method
    ItemModel item = ItemModel();
    await FirestoreUtils.addItem(item);
  }

  @override
  fetchCategories() {
    // TODO: fetch categories and show them to user to choose one
    throw UnimplementedError();
  }

  @override
  updateItem() {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  deleteItem() {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }
}