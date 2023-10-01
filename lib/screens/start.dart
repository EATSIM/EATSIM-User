import 'package:flutter/material.dart';
import '../widgets/b_main.dart';
import '../widgets/b_start.dart';
import '../widgets/d_info.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StartAppBar(title: '대구가톨릭대학교'),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: MyContainer(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: StartBottomBox(),
          ),
        ],
      ),
    );
  }
}
