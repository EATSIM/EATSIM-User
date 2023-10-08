import 'package:eat_sim/models/school_name.dart';
import 'package:flutter/material.dart';
import 'main_button_set.dart';
import '../widgets/checkbox.dart';
import '../widgets/dialog.dart';
import '../widgets/fail_dialog.dart';
import 'logo.dart';
import '../widgets/school_list_widget.dart';

class LoginTextInputWidget extends StatefulWidget {
  const LoginTextInputWidget({Key? key}) : super(key: key);

  @override
  _LoginTextInputWidgetState createState() => _LoginTextInputWidgetState();
}

class _LoginTextInputWidgetState extends State<LoginTextInputWidget> {
  late int _selectedSchool;
  bool _personalInfoChecked = false;
  bool _serviceTermsChecked = false;
  final List<School> _schoolList = [];
  String _searchQuery = '';
  bool _isListVisible = false;

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

  final TextEditingController _schoolSearchController = TextEditingController();

  @override
  void dispose() {
    _schoolSearchController.dispose();
    super.dispose();
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const CompletionDialog();
      },
    );
  }

  void _showIncompleteInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const FailDialog();
      },
    );
  }

  void _onMembershipButtonPressed() {
    if (_personalInfoChecked &&
        _serviceTermsChecked &&
        _schoolSearchController.text.isNotEmpty &&
        _selectedSchool != null) {
      _showCompletionDialog();
    } else {
      _showIncompleteInfoDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const LogoWidget(),
        _buildTextField('ID'),
        _buildTextField('이름'),
        _buildTextField('닉네임'),
        _buildTextField('PW', isPassword: true),
        _buildTextField('PW확인', isPassword: true),
        SchoolSearchWidget(
          controller: _schoolSearchController,
          onSearch: (value) {
            setState(() {
              _searchQuery = value;
              _isListVisible = _searchQuery.isNotEmpty;
            });
          },
          isListVisible: _isListVisible,
          filteredSchools: _schoolList,
          onSchoolSelected: (school) {
            setState(() {
              _selectedSchool = school.schoolIdx;
              _schoolSearchController.text = school.schoolName;
              _isListVisible = false;
            });
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
          onPressed: _onMembershipButtonPressed,
          text: '회원가입',
        ),
        const SizedBox(height: 30),
      ],
    );
  }

  Widget _buildTextField(String labelText, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 6),
      child: TextField(
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
