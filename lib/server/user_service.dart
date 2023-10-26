import 'dart:convert';
import '../server/server_config.dart';

class UserService {
  static Future<Map<String, dynamic>?> fetchUserInfo(String token) async {
    final url = "${ServerConfig.getBaseUrl()}/user/userinfo";
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    final response = await ServerConfig.getRequest(url, headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Error fetching user info: ${response.body}");
      return null;
    }
  }
}
