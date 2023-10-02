import 'package:flutter/material.dart';
import '../buttons/membership_button.dart';
import '../widgets/circular_checkbox.dart';
import '../widgets/logo.dart';
import '../widgets/text_input_widget.dart';

class MembershipScreen extends StatefulWidget {
  const MembershipScreen({Key? key}) : super(key: key);

  @override
  _MembershipScreenState createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  String? _selectedSchool;
  bool _personalInfoChecked = false;
  bool _serviceTermsChecked = false;
  List<String> _schoolList = ['대구가톨릭대학교', '영남대학교', '대구대학교', '경북대학교', '경일대학교'];
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

  Widget _buildSchoolList() {
    if (!_isListVisible) {
      return SizedBox();
    }

    List<String> filteredSchools = _schoolList
        .where((school) =>
            school.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    filteredSchools.sort();

    if (filteredSchools.isEmpty && _searchQuery.isNotEmpty) {
      return Center(
        child: Text(
          '일치하는 학교가 없습니다.',
          style: TextStyle(
            fontSize: 13.0,
            color: Color(0xFFAFAFAF),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFBDBDBD)),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: filteredSchools.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedSchool = filteredSchools[index];
                _searchQuery = _selectedSchool ?? '';
                _isListVisible = false;
                _schoolSearchController.text = _selectedSchool ?? '';
              });
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: _selectedSchool == filteredSchools[index]
                      ? Colors
                          .black // Change the border color for selected item
                      : Colors.transparent,
                ),
              ),
              child: Text(
                filteredSchools[index],
                style: const TextStyle(
                  fontSize: 14.0,
                  letterSpacing: -0.5,
                  color: Color(0xFFBDBDBD),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  final TextEditingController _schoolSearchController = TextEditingController();

  @override
  void dispose() {
    _schoolSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const LogoWidget(),
                const TextInputWidget(
                  labelText: 'ID',
                  fontSize: 16.0,
                  color: Color(0xFFAFAFAF),
                ),
                const TextInputWidget(
                  labelText: '이름',
                  fontSize: 16.0,
                  color: Color(0xFFAFAFAF),
                ),
                const TextInputWidget(
                  labelText: '닉네임',
                  fontSize: 16.0,
                  color: Color(0xFFAFAFAF),
                ),
                const TextInputWidget(
                  labelText: 'PW',
                  fontSize: 16.0,
                  color: Color(0xFFAFAFAF),
                  isPassword: true,
                ),
                const TextInputWidget(
                  labelText: 'PW확인',
                  fontSize: 16.0,
                  color: Color(0xFFAFAFAF),
                  isPassword: true,
                ),
                TextField(
                  controller: _schoolSearchController,
                  decoration: const InputDecoration(
                    labelText: '학교 검색',
                    prefixIcon: Icon(Icons.search),
                  ),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFFBDBDBD),
                  ),
                  onTap: () {
                    setState(() {
                      _isListVisible = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                      _isListVisible = _searchQuery.isNotEmpty;
                    });
                  },
                ),
                _buildSchoolList(),
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/start');
                  },
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
