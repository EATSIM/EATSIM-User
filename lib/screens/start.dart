import 'package:flutter/material.dart';
import '../widgets/b_main.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StartAppBar(title: 'Start Screen'),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: StartBottomBox(),
          ),
        ],
      ),
    );
  }
}
