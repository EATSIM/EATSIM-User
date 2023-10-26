import 'package:flutter/material.dart';
import '../widgets/8_meun_info_widgets/info_top_bar.dart';
import '../models/foods.dart';

class InfoMenuScreen extends StatefulWidget {
  final String foodName;
  final String foodCosts;
  final String foodInfo;
  final Map<int, List<Foodmodel>> allCategoryFoods;
  final String restaurantName;
  final String token;
  final int foodIdx;
  final int restaurantIdx;
  final int categoryIdx;

  const InfoMenuScreen(
      {required this.foodName,
      required this.allCategoryFoods,
      required this.token,
      required this.foodCosts,
      required this.foodInfo,
      required this.restaurantName,
      required this.foodIdx,
      required this.restaurantIdx,
      required this.categoryIdx,
      Key? key})
      : super(key: key);

  @override
  _InfoMenuScreenState createState() => _InfoMenuScreenState();
}

class _InfoMenuScreenState extends State<InfoMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurantName),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF7AF48),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: InfoTopBar(
        foodName: widget.foodName,
        foodCost: widget.foodCosts,
        foodInfo: widget.foodInfo,
        restaurantName: widget.restaurantName,
        token: widget.token,
        restaurantIdx: widget.restaurantIdx,
        categoryIdx: widget.categoryIdx,
        foodIdx: widget.foodIdx,
      ),
    );
  }
}
