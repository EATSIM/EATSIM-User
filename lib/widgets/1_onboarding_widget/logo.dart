import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double width;

  const LogoWidget({Key? key, this.height = 269, this.width = 269})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon/logo.png',
      height: height,
      width: width,
    );
  }
}
