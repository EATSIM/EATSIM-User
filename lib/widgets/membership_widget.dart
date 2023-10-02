import 'package:flutter/material.dart';

import 'login_textinput.dart';

class MembershipView extends StatelessWidget {
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: LoginTextInputWidget(),
          ),
        ),
      ),
    );
  }
}
