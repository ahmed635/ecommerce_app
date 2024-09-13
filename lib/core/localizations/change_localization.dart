import 'package:ecommerce_app/core/constants/app_theme.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  ThemeData appTheme = englishTheme;
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String languageCode) {
    Locale locale = Locale(languageCode);
    myServices.pref.setString("language", languageCode);
    appTheme = languageCode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? lang = myServices.pref.getString("language");
    if (lang == "ar") {
      language = const Locale("ar");
      appTheme = arabicTheme;
    } else if (lang == "en") {
      language = const Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
