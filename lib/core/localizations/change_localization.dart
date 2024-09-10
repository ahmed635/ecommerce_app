import 'dart:ui';

import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';

class LocalController extends GetxController{
  Locale? language;
  MyServices myServices = Get.find();
  changeLang(String languageCode){
    Locale locale = Locale(languageCode);
    myServices.pref.setString("language", languageCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit(){
    String? lang = myServices.pref.getString("language");
    if(lang == "ar"){
      language = const Locale("ar");
    } else if(lang == "en"){
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}