import 'package:flutter/material.dart';
import 'b_food.dart';

class TopMenuBar extends StatefulWidget {
  TopMenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<TopMenuBar> {
  final List<String> menuCategories = ['즐겨찾기', '한식', '중식'];

  final List<List<String>> foodNamesList = [
    ['즐겨찾기1', '즐겨찾기2'],
    ['김치찌개', '된장찌개', '부대찌개', '칼국수'],
    ['중식1', '중식2', '중식3']
  ];

  final List<List<String>> pricesList = [
    ['1,000', '1,500'],
    ['6,000', '6,000', '6,000', '6,000'],
    ['5,000', '5,500', '5,500']
  ];

  late List<Widget> tabContents;

  @override
  void initState() {
    super.initState();
    tabContents = [
      for (int i = 0; i < foodNamesList.length; i++)
        Food(foodNames: foodNamesList[i], prices: pricesList[i])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuCategories.length,
      child: Column(
        children: [
          Container(
            color: Color(0xFFF7AF48),
            child: TabBar(
              isScrollable: false,
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: menuCategories
                  .map((category) => Tab(text: category))
                  .toList(),
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
