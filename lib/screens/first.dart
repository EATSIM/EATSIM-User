import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/app_bar_set.dart';
import 'restaurant.dart';
import '13_order_list.dart';
import '12_view_reviews.dart';
import '15_info_personal.dart';
import '../models/school_name.dart';

class firstScreeon extends StatefulWidget {
  const firstScreeon({Key? key}) : super(key: key);

  @override
  _firstScreeonState createState() => _firstScreeonState();
}

class _firstScreeonState extends State<firstScreeon> {
  int _selectedIndex = 0;
  Map<String, dynamic>? _userInfo;
  String? _schoolName;

  final List<Widget> _pages = [
    RestaurantScreen(),
    ViewReviewsScreen(),
    OrderListScreen(),
    InfoPersonalScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    final token = await _fetchToken();
    if (token != null) {
      await _fetchAndSetUserInfo(token);
    }
  }

  Future<String?> _fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Future<void> _fetchAndSetUserInfo(String token) async {
    final userInfo = await _fetchUserInfo(token);
    if (userInfo != null) {
      setState(() => _userInfo = userInfo);
      if (_userInfo!['schoolIdx'] != null) {
        final school = await _fetchSchoolName(
            _userInfo!['schoolIdx'], token); // changed to 'school'
        if (school != null) {
          setState(() => _schoolName =
              school.schoolName); // get the schoolName from the School model
        }
      }
    }
  }

  Future<Map<String, dynamic>?> _fetchUserInfo(String token) async {
    final url = "http://10.0.2.2:8080/main/userinfo";
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    final response = await _getRequest(url, headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print("Error fetching user info: ${response.body}");
      return null;
    }
  }

  Future<School?> _fetchSchoolName(int schoolIdx, String token) async {
    final url = "http://10.0.2.2:8080/main/schoolname/$schoolIdx";
    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Bearer $token",
    };
    final response = await _getRequest(url, headers);
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final school = School.fromJson(responseBody);
      return school;
    } else {
      print("Error fetching school name: ${response.body}");
      return null;
    }
  }

  Future<http.Response> _getRequest(String url,
      [Map<String, String>? headers]) async {
    print('Fetching data from URL: $url');
    final response = await http.get(Uri.parse(url), headers: headers);
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildUserInfoDisplay(),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: StartBottomBox(
        initialIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildUserInfoDisplay() {
    if (_userInfo == null) {
      return Container(); // 빈 컨테이너 (아무것도 표시하지 않음)
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // 컨텐츠 크기만큼만 공간을 차지하게 설정
          children: <Widget>[
            Text("ID: ${_userInfo?['idx'] ?? 'N/A'}"),
            Text("User ID: ${_userInfo?['userID'] ?? 'N/A'}"),
            Text("User Name: ${_userInfo?['userName'] ?? 'N/A'}"),
            Text("Call Number: ${_userInfo?['userCallNumber'] ?? 'N/A'}"),
            Text("schoolIdx: ${_userInfo?['schoolIdx'] ?? 'N/A'}"),
            Text("Created At: ${_userInfo?['createdAt'] ?? 'N/A'}"),
            Text("Updated At: ${_userInfo?['updatedAt'] ?? 'N/A'}"),
          ],
        ),
      );
    }
  }

  PreferredSizeWidget _buildAppBar() {
    String title = _schoolName ?? '대구가톨릭대학교';
    switch (_selectedIndex) {
      case 1:
        return const infoAppBar(title: 'REVIEW');
      case 2:
        return const infoAppBar(title: 'Order List');
      case 3:
        return const infoAppBar(title: 'Profile');
      default:
        return RestaurantAppBar(title: title);
    }
  }
}

class StartBottomBox extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onTap;

  const StartBottomBox({Key? key, this.initialIndex = 0, required this.onTap})
      : super(key: key);

  @override
  _StartBottomBoxState createState() => _StartBottomBoxState();
}

class _StartBottomBoxState extends State<StartBottomBox> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 395,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: const Color(0xffC5C5C5), width: 0.5),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildImageWithText(context, Icons.home_outlined, 'HOME', 0),
          _buildImageWithText(context, Icons.rate_review_outlined, 'REVIEW', 1),
          _buildImageWithText(context, Icons.description_outlined, 'ORDER', 2),
          _buildImageWithText(context, Icons.person_outlined, 'MY', 3),
        ],
      ),
    );
  }

  Widget _buildImageWithText(
      BuildContext context, IconData iconData, String label, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        if (selectedIndex != index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onTap(index);
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 10),
          Icon(
            iconData,
            size: 24,
            color: isSelected ? Colors.black : const Color(0xFFC5C5C5),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : const Color(0xFFC5C5C5),
            ),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
