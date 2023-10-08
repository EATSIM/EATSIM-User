import 'package:flutter/material.dart';

class ProfilesBox extends StatefulWidget {
  const ProfilesBox({super.key});

  @override
  _ProfilesBoxState createState() => _ProfilesBoxState();
}

class _ProfilesBoxState extends State<ProfilesBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358,
      height: 354,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(-3, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 10),
              child: _buildRow('ID', '아이디'),
            ),
            Container(
              height: 1,
              color: const Color(0xFFEDEDED),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 10),
              child: _buildRow('이름', '아이디'),
            ),
            Container(
              height: 1,
              color: const Color(0xFFEDEDED),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 10),
              child: _buildRow('닉네임', '아이디'),
            ),
            Container(
              height: 1,
              color: const Color(0xFFEDEDED),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 35, 10),
              child: _buildRow('비밀번호', '아이디'),
            ),
            Container(
              height: 1,
              color: const Color(0xFFEDEDED),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(35, 15, 20, 10),
              child: _buildRow('전화번호', '010-1234-5678'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, color: Color(0xffBDBDBD)),
        ),
        Text(
          content,
          style: const TextStyle(fontSize: 17, color: Color(0xff000000)),
        ),
      ],
    );
  }
}
