import 'package:flutter/material.dart';

// 프로필 박스
class ProfileBox extends StatelessWidget {
  const ProfileBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 365.0,
      height: 88.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: const Color(0xffBDBDBD),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildHeader(context),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.account_circle,
          size: 68,
          color: Color(0xff000000),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '이름',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.room,
                    size: 15,
                    color: Color(0xffBDBDBD),
                  ),
                  SizedBox(width: 5),
                  Text(
                    'school',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffBDBDBD),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/change_info_personal');
          },
          child: const Icon(
            Icons.play_arrow,
            color: Color(0xffBDBDBD),
            size: 24,
          ),
        ),
      ],
    );
  }
}
