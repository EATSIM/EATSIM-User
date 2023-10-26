import 'dart:convert';
import '../models/category_info.dart';
import '../server/server_config.dart';

class CategoryService {
  static Future<List<Category>> fetchCategorysByRestaurant(
      int restaurantIdx, String token) async {
    final url = "${ServerConfig.getBaseUrl()}/user/category/$restaurantIdx";
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    print('Sending GET request to: $url');
    final response = await ServerConfig.getRequest(url, headers);
    if (response.statusCode == 200) {
      print('totoResponse body: ${response.body}');
      final List<dynamic> responseBody = json.decode(response.body);
      return responseBody.map((json) => Category.fromJson(json)).toList();
    } else {
      print(
          'Failed to fetch restaurants. Response code: ${response.statusCode}. Response body: ${response.body}');
      throw Exception("Failed to load categorys");
    }
  }
}
