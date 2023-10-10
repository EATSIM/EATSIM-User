import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../models/school_name.dart';

Future<List<School>> fetchSchools() async {
  var headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  var host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  var url = Uri.parse('http://$host:8080/main/school');

  final response = await http.get(url, headers: headers);

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