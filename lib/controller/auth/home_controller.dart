import 'package:ecommerce_app/data/model/categorites_model.dart';
import 'package:ecommerce_app/data/model/item_model.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  List<CategoryModel> fetchCategories();

  List<ItemModel> fetchOfferedItems();
}

class HomeControllerImpl extends HomeController {
  List<CategoryModel> categories = [];
  List<ItemModel> items = [];

  @override
  List<CategoryModel> fetchCategories() {
    List<CategoryModel> categories = [];
    for (int i = 1; i < 8; i++) {
      CategoryModel category = CategoryModel(
        id: "$i",
        nameAr: "category $i",
        nameEn: "category $i",
        dateTime: DateTime.now(),
        items: [
          ItemModel(id: "$i", nameAr: "Item Item $i", nameEn: "Item Item Item $i", discount: 33),
          ItemModel(id: "$i", nameAr: "Item $i", nameEn: "Item $i")
        ],
      );
      categories.add(category);
    }
    return categories;
  }

  @override
  void onInit() {
    categories = fetchCategories();
    items = fetchOfferedItems();
    super.onInit();
  }

  @override
  List<ItemModel> fetchOfferedItems() {
    List<ItemModel> items = [];
    for (var category in categories) {
      Iterable<ItemModel> iterable = category.items as Iterable<ItemModel>;
      items.addAll(iterable);
    }
    items.removeWhere((element) => element.discount == null);
    return items;
  }
}
