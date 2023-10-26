import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:eat_sim/provider.dart';
import 'package:provider/provider.dart';
import '../server/server_config.dart';

class LoginService {
  final TextEditingController _userIdController;
  final TextEditingController _passwordController;
  final BuildContext context;

  LoginService({
    required TextEditingController userIdController,
    required TextEditingController passwordController,
    required this.context,
  })  : _userIdController = userIdController,
        _passwordController = passwordController;

  Future<void> handleLogin() async {
    final url = "${ServerConfig.getBaseUrl()}/user/login";

    print("Attempting to login with URL: $url");

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
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

      await _saveToken(accessToken, tokenType);
      Provider.of<AuthProvider>(context, listen: false)
          .setToken('$tokenType $accessToken');

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
}
