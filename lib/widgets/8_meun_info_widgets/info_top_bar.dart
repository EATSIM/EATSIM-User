import 'package:flutter/material.dart';
import '../main_button_set.dart';
import '../12_view_review_widgets/review_box.dart';
import '../../models/cart_item.dart';
import 'package:provider/provider.dart';
import '../../provider.dart';

import 'package:flutter/foundation.dart';

class InfoTopBar extends StatefulWidget {
  final String foodName;
  final String foodCost;
  final String restaurantName;
  final String token;
  final int foodIdx;
  final int restaurantIdx;
  final int categoryIdx;
  final String foodInfo;

  InfoTopBar(
      {required this.foodName,
      required this.foodCost,
      required this.token,
      required this.restaurantName,
      required this.foodIdx,
      required this.restaurantIdx,
      required this.categoryIdx,
      required this.foodInfo,
      Key? key})
      : super(key: key);

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
            widget.foodName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            widget.foodCost,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Visibility(
            visible: widget.foodInfo != null && widget.foodInfo.isNotEmpty,
            child: Text(
              widget.foodInfo ?? '', // null이면 빈 문자열을 보여줍니다.
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     for (int j = 0; j < 4; j++)
          //       Icon(
          //         Icons.star,
          //         color: Colors.grey,
          //         size: 20,
          //       ),
          //     Icon(
          //       Icons.star_border,
          //       color: Colors.grey,
          //       size: 20,
          //     ),
          //   ],
          // ),
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
          SizedBox(height: 150),
          MainButtonSet(
            onPressed: () {
              _addToCart(context);
            },
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

  void _addToCart(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    debugPrint('Adding to cart...');
    debugPrint('Food Name: ${widget.foodName}');
    debugPrint('Food Cost: ${widget.foodCost}');
    debugPrint('Restaurant Name: ${widget.restaurantName}');
    debugPrint('Food Index: ${widget.foodIdx}');
    debugPrint('Restaurant Index: ${widget.restaurantIdx}');
    debugPrint('Category Idx : ${widget.categoryIdx}');

    final cartItem = CartItem(
      foodName: widget.foodName,
      foodCost: widget.foodCost,
      restaurantName: widget.restaurantName,
      foodIdx: widget.foodIdx,
      restaurantIdx: widget.restaurantIdx,
      categoryIdx: widget.categoryIdx,
    );
    cartProvider.addItem(cartItem);
    debugPrint('Item added to cart successfully!');
    Navigator.pop(context);
  }
}
