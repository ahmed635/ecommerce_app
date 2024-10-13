import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/data_source/remote/firestore/firestore_utils.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserUtils {
  static Future<User?> createUser(
      String email, String password, String username, String phone) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return createUserDetails(userCredential, username, phone);
  }

  static Future<User?> createUserDetails(
      UserCredential userCredential, String username, String phone) async {
    User? user = userCredential.user;
    UserModel currentUser = UserModel(
      id: user?.uid,
      username: username,
      phone: phone,
      email: user?.email,
    );
    if (user != null) {
      await FirestoreUtils.addUser(currentUser);
      FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set(currentUser.toJson());
    }
    return user;
  }

  static Future<void> sendEmailVerificationMessage(User? user) async {
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  static Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> sendEmailRestPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    var userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    return createUserDetails(userCredential, "", "");
  }

  static Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
