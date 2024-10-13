import 'package:ecommerce_app/model/categorites_model.dart';
import 'package:ecommerce_app/view/screens/admin/item/add_item_screen.dart';
import 'package:get/get.dart';

abstract class CategoryListViewController extends GetxController {
  addCategory();

  deleteCategory(int? index);

  updateCategory(int? index, CategoryModel? newCategory);

  fetchCategories();

  navigateToCategoryScreen();
}

class CategoryListViewControllerImpl extends CategoryListViewController {
  // TODO: fetch available categories from database
  List<CategoryModel> categories = [];

  @override
  addCategory() {
    // TODO: implement addNewItem
    throw UnimplementedError();
  }

  @override
  deleteCategory(int? index) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  updateCategory(int? index, CategoryModel? newCategory) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  fetchCategories() {
    // TODO: implement fetchCategories
    throw UnimplementedError();
  }

  @override
  navigateToCategoryScreen() {
    Get.to(AddItemScreen.routeName);
  }
}
