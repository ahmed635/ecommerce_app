import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/item_model.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:flutter/foundation.dart';

import '../firebase_endpoints.dart';
import '../../../../model/categorites_model.dart';
import '../../../../model/offer_model.dart';

class FirestoreUtils {
  static var firestore = FirebaseFirestore.instance;
  static var categoriesRef = firestore.collection(FirebaseEndpoints.CATEGORIES);
  static var itemsRef = firestore.collection(FirebaseEndpoints.ITEMS);
  static var offersRef = firestore.collection(FirebaseEndpoints.OFFERS);
  static var usersRef = firestore.collection(FirebaseEndpoints.USERS);

  static Future<List<CategoryModel>> fetchCategories() async {
    List<CategoryModel> categories = [];
    try {
      var snapshot = await categoriesRef.get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          categories.add(CategoryModel.fromJson(doc.data()));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return categories;
  }

  static Future<List<ItemModel>> fetchItems() async {
    List<ItemModel> items = [];
    try {
      var snapshot = await itemsRef.get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          items.add(ItemModel.fromJson(doc.data()));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return items;
  }

  static Future<OfferModel> fetchCurrentOffer() async {
    List<OfferModel> offers = [];
    try {
      final snapshot = await offersRef.where("active", isEqualTo: true).get();
      if (snapshot.docs.isNotEmpty) {
        for (var doc in snapshot.docs) {
          offers.add(OfferModel.fromJson(doc.data()));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return offers.first;
  }

  static Future<void> addCategory(CategoryModel category) async {
    try {
      final data = await categoriesRef.add(category.toJson());
      if (kDebugMode) {
        print("Data id: ${data.id}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<void> addItem(ItemModel item) async {
    try {
      final data = await itemsRef.add(item.toJson());
      if (kDebugMode) {
        print("Data id: ${data.id}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<void> addOffer(OfferModel offer) async {
    try {
      final data = await offersRef.add(offer.toJson());
      if (kDebugMode) {
        print("Data id: ${data.id}");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<void> addUser(UserModel user) async {
    try {
      await usersRef.doc(user.id).set(user.toJson());
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
