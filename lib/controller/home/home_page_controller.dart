import 'package:ecommerce_app/data/data_source/remote/firestore/firestore_utils.dart';
import 'package:ecommerce_app/view/screens/items/items_screen.dart';
import 'package:get/get.dart';

import '../../model/categorites_model.dart';
import '../../model/item_model.dart';
import '../../model/offer_model.dart';

abstract class HomePageController extends GetxController {
  fetchItems();

  fetchCategories();

  fetchCurrentOffer();

  navigateToItemsScreen(List categories, int index);
}

class HomePageControllerImpl extends HomePageController {
  List<CategoryModel> categories = [];
  List<ItemModel> items = [];
  OfferModel currentOffer =
      OfferModel(titleEn: "waiting", descriptionEn: "waiting");

  @override
  void onInit() async {
    await _loadDataFromServer();
    super.onInit();
  }

  Future<void> _loadDataFromServer() async {
    await fetchCategories();
    await fetchCurrentOffer();
    await fetchItems();
  }

  @override
  fetchCategories() async {
    categories = await FirestoreUtils.fetchCategories();
  }

  @override
  fetchCurrentOffer() async {
    currentOffer = await FirestoreUtils.fetchCurrentOffer();
    return currentOffer;
  }

  @override
  fetchItems() async {
    items = await FirestoreUtils.fetchItems();
  }

  @override
  navigateToItemsScreen(List? categories, int? index) {
    Get.toNamed(ItemsScreen.routeName, arguments: {
      "categories": categories,
      "categoryIndex": index,
    });
  }
}
