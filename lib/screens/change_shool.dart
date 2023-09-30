import 'package:flutter/material.dart';

class ChangeSchoolScreen extends StatefulWidget {
  const ChangeSchoolScreen({Key? key}) : super(key: key);

  @override
  _ChangeSchoolScreenState createState() => _ChangeSchoolScreenState();
}

class _ChangeSchoolScreenState extends State<ChangeSchoolScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ChangeSchoolScreen Screen')),
      body: Center(
        child: Text('Welcome to ChangeSchoolScreen Screen!'),
      ),
    );
  }
}
