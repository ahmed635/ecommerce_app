import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;
  final FormFieldValidator validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.iconData,
      required this.controller,
      required this.validator,
      this.keyboardType,
      this.obscureText,
      this.onTapIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        suffixIcon: InkWell(
          onTap: onTapIcon,
          child: Icon(iconData),
        ),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(labelText)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
