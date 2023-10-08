import 'package:flutter/material.dart';

class SchoolBox extends StatefulWidget {
  final String schoolName;

  SchoolBox({required this.schoolName});

  @override
  _SchoolBoxState createState() => _SchoolBoxState();
}

class _SchoolBoxState extends State<SchoolBox> {
  bool _isStarSelected = false; // 상태를 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 393.0,
      height: 79.0,
      padding: EdgeInsets.fromLTRB(30.0, 10, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.school,
                size: 27,
              ),
              SizedBox(width: 25.0),
              Text(
                widget.schoolName,
                style: TextStyle(fontSize: 16, color: Color(0xff626262)),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isStarSelected = !_isStarSelected;
              });
            },
            child: Icon(
              _isStarSelected ? Icons.star : Icons.star_border,
              size: 27,
            ),
          ),
        ],
      ),
    );
  }
}
