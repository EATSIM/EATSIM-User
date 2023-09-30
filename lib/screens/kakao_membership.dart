import 'package:flutter/material.dart';

class KakaoMembershipScreen extends StatefulWidget {
  const KakaoMembershipScreen({Key? key}) : super(key: key);

  @override
  _KakaoMembershipScreenState createState() => _KakaoMembershipScreenState();
}

class _KakaoMembershipScreenState extends State<KakaoMembershipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KakaoMembershipScreen Screen')),
      body: Center(
        child: Text('Welcome to KakaoMembershipScreen Screen!'),
      ),
    );
  }
}
