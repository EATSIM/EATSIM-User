import 'package:flutter/material.dart';
import '../widgets/login_widget.dart'; // Import the LoginView

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _autoLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginWidget(
        autoLogin: _autoLogin,
        onAutoLoginChanged: (value) {
          setState(() {
            _autoLogin = value;
          });
        },
      ),
    );
  }
}
