import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final bool? isPassword;
  final TextEditingController? controller;

  const CustomTextfield({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.isPassword,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: Icon(suffixIcon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
