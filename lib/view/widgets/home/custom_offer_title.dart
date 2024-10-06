import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomOfferTitle extends StatelessWidget {
  const CustomOfferTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Shop Today's Deal",
      style: TextStyle(
          color: AppColor.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}
