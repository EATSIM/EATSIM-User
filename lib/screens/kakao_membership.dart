import 'package:flutter/material.dart';
import '../buttons/membership_button.dart';
import '../widgets/dialog.dart';
import '../widgets/fail_dialog.dart';
import '../widgets/logo.dart';
import '../widgets/school_list_widget.dart';
import 'school_list.dart';

class KakaoMembershipScreen extends StatefulWidget {
  const KakaoMembershipScreen({Key? key}) : super(key: key);

  @override
  _KakaoMembershipScreenState createState() => _KakaoMembershipScreenState();
}

class _KakaoMembershipScreenState extends State<KakaoMembershipScreen> {
  String? _selectedSchool;
  final List<String> _schoolList = schoolList;
  String _searchQuery = '';
  bool _isListVisible = false;

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
    // Check if all fields are filled
    if (_schoolSearchController.text.isNotEmpty) {
      _showCompletionDialog(); // Show the completion dialog
    } else {
      _showIncompleteInfoDialog(); // Show the incomplete info dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const LogoWidget(),
                _buildTextField('닉네임'),
                _buildTextField('전화번호'),
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
                      .where((school) => school
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
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
                const SizedBox(height: 170),
                MembershipButton(
                  onPressed: _onMembershipButtonPressed,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
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
