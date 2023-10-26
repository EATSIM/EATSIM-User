import 'package:flutter/material.dart';
import '../widgets/app_bar_set.dart';
import '5_restaurant.dart';
import '13_order_list.dart';
import '12_view_reviews.dart';
import '15_info_personal.dart';
import '../server/server_config.dart';
import '../server/user_service.dart';
import '../server/school_service.dart';
import '../widgets/4_first_widgets/firstBottomBox.dart';
import '../provider.dart';
import 'package:provider/provider.dart';
import '../models/user_info.dart';

const defaultColor = Color(0xFFC5C5C5);

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _selectedIndex = 0;
  Map<String, dynamic>? _userInfo;
  String? _schoolName;
  List<Widget>? _pages;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    String? token = await AuthService.fetchToken();
    if (token == null) return;

    _userInfo = await UserService.fetchUserInfo(token);

    if (_userInfo != null) {
      UserDto user = UserDto.fromJson(_userInfo!);

      // UserProvider에 접근하여 setUser 메서드 호출
      Provider.of<UserProvider>(context, listen: false).setUser(user);

      _schoolName =
          (await SchoolService.fetchSchoolName(_userInfo?['schoolIdx'], token))
              ?.schoolName;

      setState(() {
        _pages = [
          RestaurantScreen(
            schoolIdx: _userInfo?['schoolIdx'] ?? 0,
            token: token,
          ),
          ViewReviewsScreen(),
          OrderListScreen(
            userInfo: _userInfo,
            token: token,
          ),
          InfoPersonalScreen(),
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages ?? [],
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

// Widget _buildUserInfoDisplay() {
  //   if (_userInfo == null) {
  //     return Container();
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Text("ID: ${_userInfo?['idx'] ?? 'N/A'}"),
  //           Text("User ID: ${_userInfo?['userID'] ?? 'N/A'}"),
  //           Text("User Name: ${_userInfo?['userName'] ?? 'N/A'}"),
  //           Text("Call Number: ${_userInfo?['userCallNumber'] ?? 'N/A'}"),
  //           Text("schoolIdx: ${_userInfo?['schoolIdx'] ?? 'N/A'}"),
  //           Text("Created At: ${_userInfo?['createdAt'] ?? 'N/A'}"),
  //           Text("Updated At: ${_userInfo?['updatedAt'] ?? 'N/A'}"),
  //         ],
  //       ),
  //     );
  //   }
  // }

