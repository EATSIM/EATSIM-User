import 'dart:convert';
import '../server/server_config.dart';
import '../models/foods.dart';

class FoodServer {
  static Future<List<Foodmodel>> fetchFoodByCategory(
      int categoryIdx, String token) async {
    final url = "${ServerConfig.getBaseUrl()}/user/food/$categoryIdx";
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    print('Sending GET request to: $url');
    final response = await ServerConfig.getRequest(url, headers);
    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((json) => Foodmodel.fromJson(json)).toList();
    } else {
      print(
          'Failed to fetch category. Response code: ${response.statusCode}. Response body: ${response.body}');
      throw Exception("Failed to load foods");
    }
  }
}
