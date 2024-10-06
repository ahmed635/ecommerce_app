import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomCardOffer extends StatelessWidget {
  final String? offerTitle;
  final String? offerDescription;

  const CustomCardOffer(
      {super.key, required this.offerTitle, required this.offerDescription});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            title: Text(
              offerTitle!,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            subtitle: Text(
              offerDescription!,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(150),
            ),
          ),
        )
      ]),
    );
  }
}
