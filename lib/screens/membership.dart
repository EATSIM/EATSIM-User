import 'package:eat_sim/models/school_name.dart';
import 'package:flutter/material.dart';
import '../widgets/main_button_set.dart';
import '../widgets/checkbox.dart';
import '../widgets/dialog.dart';
import '../widgets/fail_dialog.dart';
import '../widgets/1_onboarding_widget/logo.dart';
import '../widgets/school_list_widget.dart';
import '../server/school_service.dart';
import '../server/membership_server.dart';

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

  late int selectedSchool;

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

      // 함수 호출 추가
      MembershipService.onMembershipButtonPressed2(
        phoneNumber ?? '',
        _idController.text,
        _nameController.text,
        _nicknameController.text,
        _pwController.text,
        selectedSchool.toString(),
      );
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
                              selectedSchool = school.schoolIdx;
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
