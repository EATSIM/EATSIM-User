import 'dart:convert';
import '../models/restaurant_info.dart';
import '../server/server_config.dart';

class RestaurantService {
  static Future<List<Restaurant>> fetchRestaurantsBySchool(
      int schoolIdx, String token) async {
    final url = "${ServerConfig.getBaseUrl()}/user/restaurant/$schoolIdx";
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    print('Sending GET request to: $url');
    final response = await ServerConfig.getRequest(url, headers);
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((json) => Restaurant.fromJson(json)).toList();
    } else {
      print(
          'Failed to fetch restaurants. Response code: ${response.statusCode}. Response body: ${response.body}');
      throw Exception("Failed to load restaurants");
    }
  }
}
