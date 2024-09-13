import 'package:ecommerce_app/core/localizations/change_localization.dart';
import 'package:ecommerce_app/core/localizations/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/my_binding.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screens/language_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
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
