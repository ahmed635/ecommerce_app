import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:ecommerce_app/core/localizations/change_localization.dart';
import 'package:ecommerce_app/core/localizations/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/screens/language.dart';

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
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        fontFamily: "PlayfairDisplay",
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: AppColor.black),
          bodyText1: TextStyle(
              height: 2.5,
              color: AppColor.grey,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      home: const LanguageScreen(),
      routes: routes,
    );
  }
}