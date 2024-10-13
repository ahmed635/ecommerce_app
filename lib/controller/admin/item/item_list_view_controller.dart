import 'package:ecommerce_app/view/screens/admin/item/add_item_screen.dart';
import 'package:get/get.dart';

import '../../../model/item_model.dart';

abstract class ItemListViewController extends GetxController {
  addItem();

  deleteItem(int? index);

  updateItem(int? index,ItemModel? newItem);

  fetchItems();

  navigateToItemScreen();
}

class ItemListViewControllerImpl extends ItemListViewController {
  // TODO: fetch available item from database
  List<ItemModel> items = [];

  @override
  addItem() {
    // TODO: implement addNewItem
    throw UnimplementedError();
  }

  @override
  deleteItem(int? index) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  updateItem(int? index, ItemModel? newItem) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  @override
  fetchItems() {
    Get.to(AddItemScreen.routeName);
  }

  @override
  navigateToItemScreen() {
    // TODO: implement navigateToItemScreen
    throw UnimplementedError();
  }
}
