import 'package:flutter/material.dart';
import 'main_button_set.dart';
import '12_view_review_widgets/review_box.dart';

class InfoTopBar extends StatefulWidget {
  InfoTopBar({Key? key}) : super(key: key);

  @override
  _InfoTopBarState createState() => _InfoTopBarState();
}

class _InfoTopBarState extends State<InfoTopBar> {
  final List<String> menu = ['원산지 및 알레르기', '음식 리뷰'];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menu.length,
      initialIndex: selectedIndex,
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
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: _buildFirstTab(),
                ),
                SingleChildScrollView(
                  child: _buildSecondTab(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstTab() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 10),
          ClipOval(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/icon/cafeteria.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 7),
          Text(
            '김치찌개',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '6,000',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int j = 0; j < 4; j++)
                Icon(
                  Icons.star,
                  color: Colors.grey,
                  size: 20,
                ),
              Icon(
                Icons.star_border,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: 360,
            height: 54,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 40),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '원산지 및 알레르기',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                WidgetSpan(
                  child: SizedBox(width: 10),
                ),
                WidgetSpan(
                  child: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('김치'),
              Text('국내산', style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('김치'),
              Text('국내산', style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('김치'),
              Text('국내산', style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('김치'),
              Text('국내산', style: TextStyle(color: Colors.green)),
            ],
          ),
          SizedBox(height: 150),
          MainButtonSet(
            onPressed: () {},
            text: '장바구니 담기',
          ),
        ],
      ),
    );
  }

  Widget _buildSecondTab() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ReviewBox(),
    );
  }
}