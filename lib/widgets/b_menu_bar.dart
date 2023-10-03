import 'package:flutter/material.dart';

class TopMenuBar extends StatefulWidget {
  TopMenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<TopMenuBar> {
  final List<String> menu = ['즐겨찾기', '한식', '양식', '분식', '중식'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menu.length,
      initialIndex: selectedIndex,
      child: Column(
        children: [
          Container(
            color: Color(0xFFF7AF48), // TabBar 전체의 배경 색상
            child: TabBar(
              isScrollable: false,
              indicatorColor: Colors.white, // 선택된 항목의 밑줄 색상
              indicatorWeight: 3.0, // 선택된 항목의 밑줄 굵기
              tabs: menu.map((item) => Tab(text: item)).toList(),
              labelColor: Colors.white, // 선택된 항목의 글자 색상
              unselectedLabelColor: Colors.grey,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
