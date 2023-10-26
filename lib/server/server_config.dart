import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ServerConfig {
  static Uri getBaseUrl() {
    String baseUrl = dotenv.env['BASE_URL'] ?? "http://localhost:8080";
    return Uri.parse(baseUrl);
  }

  static Future<http.Response> getRequest(String url,
      [Map<String, String>? headers]) async {
    print('Fetching data from URL: $url');
    final response = await http.get(Uri.parse(url), headers: headers);
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}

class AuthService {
  static Future<String?> fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }
}
