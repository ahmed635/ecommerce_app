import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../core/constants/app_color.dart';

class SignInWithGoogleButton extends StatelessWidget {
  final void Function() onPressed;
  String text;

  SignInWithGoogleButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.primaryColor, width: 2),
        color: const Color(0xFFffffff),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: SignInButton(
        Buttons.google,
        elevation: 0,
        text: text,
        onPressed: onPressed,
      ),
    );
  }
}
