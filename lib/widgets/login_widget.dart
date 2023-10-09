import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'checkbox.dart';
import 'logo.dart';
import 'main_button_set.dart';
import 'textinput_widget.dart';

class LoginWidget extends StatefulWidget {
  final bool autoLogin;
  final Function(bool)? onAutoLoginChanged;

  const LoginWidget({
    Key? key,
    required this.autoLogin,
    required this.onAutoLoginChanged,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final url = "http://10.0.2.2:8080/main/login";

    print("Attempting to login with URL: $url");

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8", // UTF-8 설정 추가
      },
      body: json.encode({
        'userID': _userIdController.text,
        'userPassword': _passwordController.text,
      }),
    );

    print("HTTP Response status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final String accessToken = responseBody["accessToken"];
      final String tokenType = responseBody["tokenType"];

      print("Login successful!");
      print("Received accessToken: $accessToken");
      print("Received tokenType: $tokenType");

      _saveToken(accessToken, tokenType);

      Navigator.pushNamed(context, '/first');
    } else {
      print("Error during login: ${response.body}");
    }
  }

  Future<void> _saveToken(String accessToken, String tokenType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
    await prefs.setString('tokenType', tokenType);
  }

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
              _handleLogin();
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
                    initialValue: widget.autoLogin,
                    onChanged: widget.onAutoLoginChanged,
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
      controller: labelText == "ID" ? _userIdController : _passwordController,
    );
  }
}
