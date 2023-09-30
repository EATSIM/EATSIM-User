import 'package:flutter/material.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MembershipScreen Screen')),
      body: Center(
        child: Text('Welcome to MembershipScreen Screen!'),
      ),
    );
  }
}
