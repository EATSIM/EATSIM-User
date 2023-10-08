import 'package:flutter/material.dart';
import '../widgets/app_bar_set.dart';
import 'package:eat_sim/widgets/main_button_set.dart';
import '../widgets/16_change_info_personal_widgets/profiles_box.dart';

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
      appBar: const infoAppBar(title: 'Edit Profile'),
      body: Stack(
        children: [
          const Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Center(
              child: ProfilesBox(),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(180),
                ),
                child: const Icon(
                  Icons.account_circle,
                  size: 150,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: MainButtonSet(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                text: '로그아웃',
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
