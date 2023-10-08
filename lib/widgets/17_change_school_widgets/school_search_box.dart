import 'package:flutter/material.dart';

class SchoolSearchBox extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;

  SchoolSearchBox({required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393.0,
      height: 109.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffBFBFBF)),
      ),
      child: Center(
        child: Container(
          width: 353.0,
          height: 45.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Color(0xffBFBFBF)),
          ),
          child: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 8),
              Expanded(
                child: TextField(
                  onChanged: onSearchChanged,
                  decoration: InputDecoration(
                    hintText: '학교검색',
                    hintStyle: TextStyle(
                      color: Color(0xffB1B1B1),
                      fontSize: 16.0,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
