import 'package:flutter/material.dart';

class SchoolSearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;
  final bool isListVisible;
  final List<String> filteredSchools;
  final Function(String) onSchoolSelected;

  const SchoolSearchWidget({
    required this.controller,
    required this.onSearch,
    required this.isListVisible,
    required this.filteredSchools,
    required this.onSchoolSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: '학교 검색',
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFFAFAFAF), // Set icon color
              ),
              labelStyle: TextStyle(
                color: Color(0xFFAFAFAF), // Set label (text) color
              ),
            ),
            style: const TextStyle(
              fontSize: 16.0,
              color: Color(0xFFAFAFAF),
            ),
            onTap: () {
              onSearch('');
            },
            onChanged: onSearch,
          ),
          if (isListVisible) ..._buildSchoolList(),
        ],
      ),
    );
  }

  List<Widget> _buildSchoolList() {
    return filteredSchools.map((school) {
      return GestureDetector(
        onTap: () {
          onSchoolSelected(school);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            padding: const EdgeInsets.all(13.0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xFFBDBDBD),
                  width: 0.5,
                ),
                bottom: BorderSide(
                  color: Color(0xFFBDBDBD),
                  width: 0.5,
                ),
                left: BorderSide(
                  color: Color(0xFFBDBDBD),
                  width: 0.5,
                ),
                right: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                school,
                style: const TextStyle(
                  fontSize: 13.0,
                  letterSpacing: -0.5,
                  color: Color(0xFFAFAFAF),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }
}
