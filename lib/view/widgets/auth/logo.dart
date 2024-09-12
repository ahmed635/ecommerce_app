import 'package:ecommerce_app/core/constants/app_image_assets.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImageAssets.logo, height: 200,);
  }
}
