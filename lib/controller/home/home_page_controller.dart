import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/categorites_model.dart';
import '../../model/item_model.dart';
import '../../model/offer_model.dart';

abstract class HomePageController extends GetxController {
  Future<List<CategoryModel>> fetchCategories();

  Future<List<ItemModel>> fetchItems();

  Future<OfferModel> fetchCurrentOffer();
}

class HomePageControllerImpl extends HomePageController {
  List<CategoryModel> categories = [];
  List<ItemModel> items = [];
  OfferModel currentOffer =
      OfferModel(titleEn: "waiting", descriptionEn: "waiting");

  @override
  Future<List<CategoryModel>> fetchCategories() async {
    List<CategoryModel> categories = [];
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection("categories").get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          categories.add(CategoryModel.fromJson(doc.data()));
        }
      }
    } catch (e) {
      print(e);
    }
    return categories;
  }

  @override
  void onInit() async {
    categories = await fetchCategories();
    items = await fetchItems();
    currentOffer = await fetchCurrentOffer();
    super.onInit();
  }

  @override
  Future<List<ItemModel>> fetchItems() async {
    List<ItemModel> items = [];
    try {
      var snapshot = await FirebaseFirestore.instance.collection("items").get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          items.add(ItemModel.fromJson(doc.data()));
        }
      }
    } catch (e) {
      print(e);
    }
    return items;
  }

  @override
  fetchCurrentOffer() async {
    List<OfferModel> offers = [];
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("offers")
          .where("active", isEqualTo: true)
          .get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          offers.add(OfferModel.fromJson(doc.data()));
        }
      }
    } catch (e) {
      print(e);
    }
    return offers.first;
  }
}
