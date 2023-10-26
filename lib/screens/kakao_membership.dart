import 'package:eat_sim/models/school_name.dart';
import 'package:flutter/material.dart';
import '../widgets/main_button_set.dart';
import '../widgets/dialog.dart';
import '../widgets/fail_dialog.dart';
import '../widgets/1_onboarding_widget/logo.dart';
import '../widgets/school_list_widget.dart';

class KakaoMembershipScreen extends StatefulWidget {
  const KakaoMembershipScreen({Key? key}) : super(key: key);

  @override
  _KakaoMembershipScreenState createState() => _KakaoMembershipScreenState();
}

class _KakaoMembershipScreenState extends State<KakaoMembershipScreen> {
  late int _selectedSchool;

  Future<List<School>>? _schoolNamesFuture;
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
                const SizedBox(height: 170),
                MainButtonSet(
                  onPressed: _onMembershipButtonPressed,
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
