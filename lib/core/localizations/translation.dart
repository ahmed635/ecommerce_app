import 'package:ecommerce_app/core/localizations/ar.dart';
import 'package:get/get.dart';

import 'en.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": Ar.translation,
        "en": En.translation,
      };
}
