import 'package:flutter/material.dart';
import '../widgets/b_food_info.dart';

class TopMenuBar extends StatefulWidget {
  TopMenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<TopMenuBar> {
  final List<String> menu = ['즐겨찾기', '한식', '중식'];

  final List<List<String>> foodLists = [
    ['즐겨찾기1', '즐겨찾기2'],
    ['김치찌개', '된장찌개', '부대찌개', '칼국수'],
    ['중식1', '중식2', '중식3']
  ];

  final List<List<String>> priceLists = [
    ['1,000', '1,500'],
    ['6,000', '6,000', '6,000', '6,000'],
    ['5,000', '5,500', '5,500']
  ];

  late List<Widget> tabContents;

  @override
  void initState() {
    super.initState();
    tabContents = [
      for (int i = 0; i < foodLists.length; i++)
        Food(food: foodLists[i], price: priceLists[i])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menu.length,
      child: Column(
        children: [
          Container(
            color: Color(0xFFF7AF48),
            child: TabBar(
              isScrollable: false,
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: menu.map((item) => Tab(text: item)).toList(),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
            ),
          ),
          Flexible(
            child: TabBarView(
              children: tabContents,
            ),
          ),
        ],
      ),
    );
  }
}
