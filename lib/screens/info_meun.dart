import 'package:flutter/material.dart';

class InfoMenuScreen extends StatefulWidget {
  const InfoMenuScreen({Key? key}) : super(key: key);

  @override
  _InfoMenuScreenState createState() => _InfoMenuScreenState();
}

class _InfoMenuScreenState extends State<InfoMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InfoMenuScreen Screen')),
      body: Center(
        child: Text('Welcome to InfoMenuScreen Screen!'),
      ),
    );
  }
}
