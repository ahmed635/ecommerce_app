import 'package:ecommerce_app/controller/admin/category/add_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryScreen extends StatelessWidget {
  static const String routeName = "/category_edit_screen";

  const AddCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    * TODO:   1. add image picker to get image from gallery
    * TODO:   2. refactor the text widget
    * TODO:   3. add functionality to add, update, delete an item
    * TODO:   4. when image is choose then upload it to firebaseStorage and save the link to image attribute into item
    * TODO:   5. make field validator on each text field
    * */
    return Scaffold(
      appBar: AppBar(title: const Text('Add Item')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<AddCategoryControllerImpl>(
          builder: (controller) => Form(
            child: Column(
              children: [
                // TODO:   1. add image picker to get image from gallery
                TextField(
                  controller: controller.nameAr,
                  decoration: const InputDecoration(labelText: 'Name (Arabic)'),
                ),
                TextField(
                  controller: controller.nameEn,
                  decoration:
                      const InputDecoration(labelText: 'Name (English)'),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // TODO: add style to ElevatedButton
                    ElevatedButton(
                      onPressed: () {
                        controller.addCategory();
                        Get.back(); // Navigate back to the previous screen
                      },
                      child: const Text('Add'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.updateCategory();
                        Get.back(); // Navigate back to the previous screen
                      },
                      child: const Text('Update'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.deleteCategory();
                        Get.back(); // Navigate back to the previous screen
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
