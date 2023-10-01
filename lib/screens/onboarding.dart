import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
          child: logo(),
        ),
      ),
    );
  }

  Widget logo() {
    return Image.asset(
      'assets/icon/logo.png',
      height: 300,
      width: 300,
    );
  }
}
