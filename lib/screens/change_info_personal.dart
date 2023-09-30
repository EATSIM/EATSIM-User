import 'package:flutter/material.dart';

class ChangeInfoPersonalScreen extends StatefulWidget {
  const ChangeInfoPersonalScreen({Key? key}) : super(key: key);

  @override
  _ChangeInfoPersonalScreenState createState() =>
      _ChangeInfoPersonalScreenState();
}

class _ChangeInfoPersonalScreenState extends State<ChangeInfoPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChangeInfoPersonal Screen')),
      body: Center(
        child: Text('Welcome to ChangeInfoPersonal Screen!'),
      ),
    );
  }
}
