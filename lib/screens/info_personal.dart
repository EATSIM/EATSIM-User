import 'package:flutter/material.dart';
import '../widgets/d_info.dart';
import '../widgets/profile_widget.dart';

class InfoPersonalScreen extends StatefulWidget {
  const InfoPersonalScreen({Key? key}) : super(key: key);

  @override
  _InfoPersonalScreenState createState() => _InfoPersonalScreenState();
}

class _InfoPersonalScreenState extends State<InfoPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const infoAppBar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const ProfileBox(),
            const SizedBox(height: 20),
            Container(
              height: 1,
              color: const Color(0xFFAFAFAF),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.school, size: 26),
                      SizedBox(width: 20),
                      Text(
                        '학교변경',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/change_school');
                    },
                    child: const Icon(
                      Icons.play_arrow,
                      color: Color(0xffBDBDBD),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.swap_horiz, size: 26),
                      SizedBox(width: 20),
                      Text(
                        '카카오 연동',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ProfileSwitch(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notifications, size: 26),
                      SizedBox(width: 20),
                      Text(
                        '알림 여부',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ProfileSwitch(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const StartBottomBox(initialIndex: 3),
    );
  }
}
