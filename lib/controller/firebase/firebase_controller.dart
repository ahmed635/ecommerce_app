import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

abstract class FirebaseController extends GetxController {
  currentUserState();
}

class FirebaseControllerImpl  extends FirebaseController {
  @override
  currentUserState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('----------- User is currently signed out! ----------- ');
      } else {
        print('-----------  User is signed in! ----------- ');
      }
    });
  }

  @override
  void onInit() {
    currentUserState();
    super.onInit();
  }

}