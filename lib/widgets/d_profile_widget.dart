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
        padding: const EdgeInsets.all(10.0), // 추가: Padding for inner contents
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

class ProfileSwitch extends StatefulWidget {
  const ProfileSwitch({super.key});

  @override
  _ProfileSwitchState createState() => _ProfileSwitchState();
}

class _ProfileSwitchState extends State<ProfileSwitch> {
  bool _isProfileSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 117,
      height: 25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF0F0F0)),
      child: Row(
        children: [
          _buildToggleButton('YES', _isProfileSelected, () {
            setState(() {
              _isProfileSelected = true;
            });
          }),
          _buildToggleButton('NO', !_isProfileSelected, () {
            setState(() {
              _isProfileSelected = false;
            });
          }),
        ],
      ),
    );
  }

  Expanded _buildToggleButton(
      String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffF7AF48) : null,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : const Color(0xff7E7E7E),
            ),
          ),
        ),
      ),
    );
  }
}

//로그아웃 버튼
class LogOutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LogOutButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/login');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: Color(0xffBFBFBF), width: 1.0),
          ),
        ),
        child: const Center(
          child: Text(
            '로그아웃',
            style: TextStyle(
                color: Color(0xffBFBFBF),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

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
