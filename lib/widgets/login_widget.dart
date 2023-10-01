import 'package:flutter/material.dart';
import '../widgets/circular_checkbox.dart';
import '../widgets/logo.dart';

class LoginWidget extends StatelessWidget {
  final bool autoLogin;
  final Function(bool)? onAutoLoginChanged;

  const LoginWidget({
    super.key,
    required this.autoLogin,
    required this.onAutoLoginChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoWidget(),
          _buildInputField("ID", fontSize: 16.0, color: Color(0xFFAFAFAF)),
          _buildInputField("Password",
              fontSize: 16.0, color: Color(0xFFAFAFAF), isPassword: true),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: 350,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF7AF48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Center(
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/image/kakao_login_large_wide.png',
            width: 350,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  CircularCheckbox(
                    initialValue: autoLogin,
                    onChanged: onAutoLoginChanged,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    '자동로그인',
                    style: TextStyle(color: Color(0xFFAFAFAF), fontSize: 14.0),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'ID,PW 찾기',
                    style: TextStyle(color: Color(0xFFAFAFAF), fontSize: 14.0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Text(
            '-------------- EATSIM이 처음이라면?--------------',
            style: TextStyle(
              color: Color(0xFFAFAFAF),
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cellphone');
            },
            child: const Text(
              '회원가입',
              style: TextStyle(
                color: Color(0xFFAFAFAF),
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String labelText,
      {double? fontSize, Color? color, bool isPassword = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16, color: Color(0xFFAFAFAF)),
        ),
      ),
    );
  }
}
