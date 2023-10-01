import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;
  final double? fontSize;
  final Color? color;
  final bool isPassword;

  const TextInputWidget({
    required this.labelText,
    this.fontSize,
    this.color,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
              fontSize: fontSize ?? 16, color: color ?? Color(0xFFAFAFAF)),
        ),
      ),
    );
  }
}