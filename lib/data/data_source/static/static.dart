import 'package:ecommerce_app/core/constants/app_image_assets.dart';
import 'package:ecommerce_app/data/model/on_boarding_model.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "Choose Product",
    body:
        "We have a 100k Product, Choose \n Your Product From Our E-\ncommerce Shop.",
    image: AppImageAssets.onBoardingImageOne,
  ),
  OnBoardingModel(
    title: "Easy & Safe Payment",
    body:
        "Easy Checkout & Safe Payment \n method. Trusted by our Customers \n from all over the world.",
    image: AppImageAssets.onBoardingImageTwo,
  ),
  OnBoardingModel(
    title: "Track Your Order",
    body:
        "Best Tracker has been Used For \n Track your order. You'll Know where \n your product is at the moment",
    image: AppImageAssets.onBoardingImageThree,
  ),
  OnBoardingModel(
    title: "Fast Delivery",
    body:
        "Reliable And Fast Delivery. We \n Deliver your Product the fastest \n way possible.",
    image: AppImageAssets.onBoardingImageFour,
  ),
];
