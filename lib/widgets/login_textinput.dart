import 'package:flutter/material.dart';
import '../buttons/membership_button.dart';
import '../screens/school_list.dart';
import '../widgets/checkbox.dart';
import '../widgets/dialog.dart';
import '../widgets/fail_dialog.dart';
import '../widgets/logo.dart';
import '../widgets/school_list_widget.dart';

class LoginTextInputWidget extends StatefulWidget {
  const LoginTextInputWidget({Key? key}) : super(key: key);

  @override
  _LoginTextInputWidgetState createState() => _LoginTextInputWidgetState();
}

class _LoginTextInputWidgetState extends State<LoginTextInputWidget> {
  String? _selectedSchool;
  bool _personalInfoChecked = false;
  bool _serviceTermsChecked = false;
  final List<String> _schoolList = schoolList;
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
        return CompletionDialog();
      },
    );
  }

  void _showIncompleteInfoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FailDialog();
      },
    );
  }

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
          filteredSchools: _schoolList
              .where((school) =>
                  school.toLowerCase().contains(_searchQuery.toLowerCase()))
              .toList(),
          onSchoolSelected: (school) {
            setState(() {
              _selectedSchool = school;
              _searchQuery = _selectedSchool ?? '';
              _isListVisible = false;
              _schoolSearchController.text = _selectedSchool ?? '';
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
        MembershipButton(
          onPressed: _onMembershipButtonPressed,
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
