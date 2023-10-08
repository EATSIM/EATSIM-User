import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/school_name.dart';

Future<List<School>> fetchSchools() async {
  var headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  final response = await http.get(Uri.parse('http://10.0.2.2:8080/main/school'),
      headers: headers);

  if (response.statusCode == 200) {
    print('Status Code: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<dynamic> responseBody = json.decode(response.body);
    return responseBody.map((json) => School.fromJson(json)).toList();
  } else {
    // 오류 발생 시 상태 코드와 응답 본문을 출력
    print('Status Code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load schools');
  }
}
