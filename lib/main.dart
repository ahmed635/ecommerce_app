import 'package:ecommerce_app/controller/firebase/firebase_controller.dart';
import 'package:ecommerce_app/core/localizations/change_localization.dart';
import 'package:ecommerce_app/core/localizations/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/my_binding.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'view/screens/language_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFirebase();
  await initialServices();
  runApp(const MyApp());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseControllerImpl firebaseController =
  // Get.put(FirebaseControllerImpl());
  // firebaseController.currentUserState();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    FirebaseControllerImpl firebaseController =
        Get.put(FirebaseControllerImpl());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'ecommerce_store'.tr,
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: MyBinding(),
      home: const LanguageScreen(),
      routes: routes,
      // getPages: routes,
    );
  }
}
