import 'dart:convert';
import '../models/school_name.dart';
import '../server/server_config.dart';
import 'package:http/http.dart' as http;

Future<List<School>> fetchSchools() async {
  final url =
      ServerConfig.getBaseUrl().replace(path: '/user/school').toString();
  var headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  final response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    print('Status Code: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<dynamic> responseBody = json.decode(response.body);
    return responseBody.map((json) => School.fromJson(json)).toList();
  } else {
    print('Status Code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load schools');
  }
}

class SchoolService {
  static Future<School?> fetchSchoolName(int schoolIdx, String token) async {
    final url = ServerConfig.getBaseUrl()
        .replace(path: '/user/schoolname/$schoolIdx')
        .toString();
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final school = School.fromJson(responseBody);
      return school;
    } else {
      print("Error fetching school name: ${response.body}");
      return null;
    }
  }
}
