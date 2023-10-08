import 'package:flutter/material.dart';

//리뷰 검색 버튼
class SearchButtonRow extends StatefulWidget {
  const SearchButtonRow({super.key});

  @override
  _SearchButtonRowState createState() => _SearchButtonRowState();
}

class _SearchButtonRowState extends State<SearchButtonRow> {
  int _selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _customElevatedButton("식당", 52, 31, 0),
        const SizedBox(width: 10),
        _customElevatedButton("메뉴", 54, 31, 1),
        const SizedBox(width: 10),
        _customElevatedButton("만족도", 66, 31, 2),
      ],
    );
  }

  Widget _customElevatedButton(
      String label, double width, double height, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: _selectedButtonIndex == index
            ? const Color(0xff000000)
            : const Color(0xff7E7E7E),
        backgroundColor: _selectedButtonIndex == index
            ? const Color(0xffF7AF48)
            : const Color(0xffF5F5F5),
        elevation: 2,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
