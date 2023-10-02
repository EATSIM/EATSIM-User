import 'package:flutter/material.dart';

import 'login_textinput.dart';

class MembershipView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: LoginTextInputWidget(),
          ),
        ),
      ),
    );
  }
}
