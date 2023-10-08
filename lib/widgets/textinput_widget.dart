import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final double? fontSize;
  final Color? color;
  final bool isPassword;
  final TextEditingController? controller;

  const TextInputWidget({
    super.key,
    required this.labelText,
    this.fontSize,
    this.color,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: color ?? Colors.black,
            fontSize: fontSize ?? 14.0,
          ),
        ),
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 14.0,
        ),
      ),
    );
  }
}
