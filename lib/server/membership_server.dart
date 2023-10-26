import 'dart:convert';
import 'package:http/http.dart' as http;
import '../server/server_config.dart';

class MembershipService {
  static Future<void> onMembershipButtonPressed2(
      String? phoneNumber,
      String? _idController,
      String? _nameController,
      String? _nicknameController,
      String? _pwController,
      String? _selectedSchool) async {
    final url = "${ServerConfig.getBaseUrl()}/user/membership";

    print("Attempting to register with URL: $url");

    var headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    var last8Digits = phoneNumber!.length >= 8
        ? phoneNumber.substring(phoneNumber.length - 8)
        : phoneNumber;
    var phoneNumberLong = int.tryParse(last8Digits);

    print("Parsed phone number: $phoneNumberLong");

    var body = json.encode({
      'id': _idController,
      'name': _nameController,
      'nickname': _nicknameController,
      'password': _pwController,
      'passwordConfirm': _pwController,
      'phoneNumber': phoneNumberLong,
      'school': _selectedSchool
    });

    print("Sending registration data: $body");

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print("HTTP Response status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("Registration successful!");
    } else {
      print("Error during registration: ${response.body}");
    }
  }
}
