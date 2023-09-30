import 'package:flutter/material.dart';

class InfoPersonalScreen extends StatefulWidget {
  const InfoPersonalScreen({Key? key}) : super(key: key);

  @override
  _InfoPersonalScreenState createState() => _InfoPersonalScreenState();
}

class _InfoPersonalScreenState extends State<InfoPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InfoPersonalScreen Screen')),
      body: Center(
        child: Text('Welcome to InfoPersonalScreen Screen!'),
      ),
    );
  }
}
