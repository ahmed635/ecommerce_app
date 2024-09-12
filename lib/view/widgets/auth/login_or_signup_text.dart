import 'package:ecommerce_app/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class LoginOrSignUpText extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function() onTap;

  const LoginOrSignUpText(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          textAlign: TextAlign.end,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            textTwo,
            style: TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
