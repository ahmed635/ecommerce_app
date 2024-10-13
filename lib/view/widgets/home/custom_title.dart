import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String? titleText;
  const CustomTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        titleText!,
        style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
