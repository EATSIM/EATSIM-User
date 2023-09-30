import 'package:flutter/material.dart';

class CellphoneScreen extends StatefulWidget {
  const CellphoneScreen({Key? key}) : super(key: key);

  @override
  _CellphoneScreenState createState() => _CellphoneScreenState();
}

class _CellphoneScreenState extends State<CellphoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cellphone Screen')),
      body: Center(
        child: Text('Welcome to Cellphone Screen!'),
      ),
    );
  }
}
