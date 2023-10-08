import 'package:flutter/material.dart';
import 'checkbox.dart';
import 'logo.dart';
import 'main_button_set.dart';
import 'textinput_widget.dart';

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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          const LogoWidget(),
          _buildInputField("ID",
              fontSize: 16.0, color: const Color(0xFFAFAFAF)),
          _buildInputField("Password",
              fontSize: 16.0, color: const Color(0xFFAFAFAF), isPassword: true),
          const SizedBox(height: 20),
          MainButtonSet(
            onPressed: () {
              Navigator.pushNamed(context, '/first');
            },
            text: 'Login',
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Navigate to '/kakao_membership' screen
              Navigator.pushNamed(context, '/kakao_membership');
            },
            child: Image.asset(
              'assets/image/kakao_login_large_wide.png',
              width: 350,
            ),
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
                    style: TextStyle(
                      color: Color(0xFFAFAFAF),
                      fontSize: 14.0,
                    ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 1.0,
                color: const Color(0xFFAFAFAF),
              ),
              const SizedBox(width: 10),
              const Text(
                'EATSIM이 처음이라면?',
                style: TextStyle(
                  color: Color(0xFFAFAFAF),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 100,
                height: 1.0,
                color: const Color(0xFFAFAFAF),
              ),
            ],
          ),
          const SizedBox(height: 23),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cellphone');
            },
            child: const Text(
              '회원가입',
              style: TextStyle(
                color: Color(0xFFAFAFAF),
                fontSize: 15.0,
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
    return TextInputWidget(
      labelText: labelText,
      fontSize: fontSize,
      color: color,
      isPassword: isPassword,
    );
  }
}
