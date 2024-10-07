import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomeButtonAppBar extends StatelessWidget {
  final String? title;
  final IconData? icon;
  void Function()? onPressed;
  final bool? active;

  HomeButtonAppBar(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active! ? AppColor.primaryColor : Colors.black,
          ),
          Text(
            title!,
            style: TextStyle(
              color: active! ? AppColor.primaryColor : Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
