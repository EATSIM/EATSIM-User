import 'package:eat_sim/models/school_name.dart';
import 'package:flutter/material.dart';
import '../widgets/main_button_set.dart';
import '../widgets/checkbox.dart';
import '../widgets/dialog.dart';
import '../widgets/fail_dialog.dart';
import '../widgets/logo.dart';
import '../widgets/school_list_widget.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../server/school_name.dart';


class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  final String phoneNumber;

  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwConfirmController = TextEditingController();

  late int _selectedSchool;

  bool _personalInfoChecked = false;
  bool _serviceTermsChecked = false;
  String _searchQuery = '';
  bool _isListVisible = false;
  Future<List<School>>? _schoolNamesFuture;

  final TextEditingController _schoolSearchController = TextEditingController();

  String? phoneNumber;

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber;
    _schoolNamesFuture = fetchSchools();
  }

  @override
  void dispose() {
    _schoolSearchController.dispose();
    _idController.dispose();
    _nameController.dispose();
    _nicknameController.dispose();
    _pwController.dispose();
    _pwConfirmController.dispose();
    super.dispose();
  }

  _onMembershipButtonPressed2() async {
   var host = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  var url = Uri.parse('http://$host:8080/main/membership');

    var headers = {
      'Content-Type': 'application/json; charset=utf-8',
    };

    print("Attempting to register with URL: $url");

    // phoneNumber의 뒤에서 8자리를 추출하고 long 타입으로 변환
    var last8Digits = phoneNumber!.length >= 8
        ? phoneNumber?.substring(phoneNumber!.length - 8)
        : phoneNumber;
    var phoneNumberLong = int.tryParse(last8Digits!);

    print("Parsed phone number: $phoneNumberLong");

    var body = json.encode({
      'id': _idController.text,
      'name': _nameController.text,
      'nickname': _nicknameController.text,
      'password': _pwController.text,
      'passwordConfirm': _pwController.text,
      'phoneNumber': phoneNumberLong,
      'school': _selectedSchool
    });

    print("Sending registration data: $body");

    var response = await http.post(url, headers: headers, body: body);

    print("HTTP Response status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      // 일반적으로 HTTP 200은 성공을 의미합니다.
      print("Registration successful!");
      // 성공적으로 등록됐을 때의 로직
    } else {
      print("Error during registration: ${response.body}");
      // 오류 발생 시 처리
    }
  }

//이용약관 서비스 동의 checkbox
  Widget _buildCheckbox(
      String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        CircularCheckbox(
          initialValue: value,
          onChanged: onChanged,
        ),
        const SizedBox(width: 10),
        Text(
          label,
          style: const TextStyle(fontSize: 14.0, color: Color(0xFFAFAFAF)),
        ),
      ],
    );
  }

//회원가입 성공 시 팝업
  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CompletionDialog();
      },
    );
  }

//회원가입 실패 시 팝업
  void _showIncompleteInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FailDialog();
      },
    );
  }

//회원가입 시 확인되어야 할 정보
  void _onMembershipButtonPressed() {
    if (_personalInfoChecked &&
        _serviceTermsChecked &&
        _schoolSearchController.text.isNotEmpty) {
      _showCompletionDialog();
    } else {
      _showIncompleteInfoDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const LogoWidget(),
                buildTextField(labelText: 'ID', controller: _idController),
                buildTextField(labelText: '이름', controller: _nameController),
                buildTextField(
                    labelText: '닉네임', controller: _nicknameController),
                buildTextField(
                    labelText: 'PW',
                    isPassword: true,
                    controller: _pwController),
                buildTextField(
                    labelText: 'PW확인',
                    isPassword: true,
                    controller: _pwConfirmController),
                FutureBuilder<List<School>>(
                  future: _schoolNamesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return SchoolSearchWidget(
                          controller: _schoolSearchController,
                          onSearch: (value) {
                            setState(() {
                              _searchQuery = value;
                              _isListVisible = _searchQuery.isNotEmpty;
                            });
                          },
                          isListVisible: _isListVisible,
                          filteredSchools: snapshot.data!
                              .where((school) => school.schoolName
                                  .toLowerCase()
                                  .contains(_searchQuery.toLowerCase()))
                              .toList(),
                          onSchoolSelected: (school) {
                            setState(() {
                              _selectedSchool = school.schoolIdx;
                              _schoolSearchController.text = school.schoolName;
                              _isListVisible = false;
                            });
                          },
                        );
                      }
                    } else {
                      return CircularProgressIndicator(); // 로딩 중...
                    }
                  },
                ),
                const SizedBox(height: 30),
                _buildCheckbox(
                  "개인정보 이용약관",
                  _personalInfoChecked,
                  (value) {
                    setState(() {
                      _personalInfoChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),
                _buildCheckbox(
                  "서비스 이용약관",
                  _serviceTermsChecked,
                  (value) {
                    setState(() {
                      _serviceTermsChecked = value!;
                    });
                  },
                ),
                const SizedBox(height: 30),
                MainButtonSet(
                  onPressed: () {
                    _onMembershipButtonPressed();
                    _onMembershipButtonPressed2();
                  },
                  text: '회원가입',
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class buildTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;

  buildTextField({
    required this.labelText,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Color(0xFFAFAFAF),
          ),
        ),
        style: const TextStyle(
          color: Color(0xFFAFAFAF),
        ),
      ),
    );
  }
}
