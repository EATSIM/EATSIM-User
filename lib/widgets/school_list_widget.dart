import 'package:flutter/material.dart';

class SchoolListWidget extends StatelessWidget {
  final List<String> filteredSchools;
  final String selectedSchool;
  final ValueChanged<String> onSchoolSelected;

  SchoolListWidget({
    required this.filteredSchools,
    required this.selectedSchool,
    required this.onSchoolSelected,
  });

  @override
  Widget build(BuildContext context) {
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
              onSchoolSelected(filteredSchools[index]);
            },
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedSchool == filteredSchools[index]
                      ? Colors.black
                      : Colors.transparent,
                ),
              ),
              child: Text(
                filteredSchools[index],
                style: TextStyle(
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
}
