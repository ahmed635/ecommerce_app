import 'package:ecommerce_app/core/constants/app_image_assets.dart';
import 'package:get/get.dart';

import '../../../model/on_boarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "choose_product".tr,
    body: "choose_product_description".tr,
    image: AppImageAssets.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: "safe_payment".tr,
    body: "safe_payment_description".tr,
    image: AppImageAssets.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: "track_your_order".tr,
    body: "track_your_order_description".tr,
    image: AppImageAssets.onBoardingImageThree,
  ),
  OnBoardingModel(
    title: "fast_delivery".tr,
    body: "fast_delivery_description".tr,
    image: AppImageAssets.onBoardingImageFour,
  ),
];
