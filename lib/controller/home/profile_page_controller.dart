import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class ProfilePageController extends GetxController {
  fetchUserProfile();
}

class ProfilePageControllerImpl extends ProfilePageController {
  var currentUser = FirebaseAuth.instance.currentUser;
  UserModel? userModel;

  @override
  fetchUserProfile() async {
    try {
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser?.uid)
          .get();
      if (snapshot.exists) {
        print(snapshot.data());
        userModel = UserModel.fromJson(snapshot.data()!);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() async {
    await fetchUserProfile();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
