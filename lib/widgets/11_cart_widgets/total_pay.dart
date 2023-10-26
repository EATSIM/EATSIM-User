import 'package:flutter/material.dart';

class TotalPay extends StatelessWidget {
  final String foodName;
  final String count;
  final TextStyle foodNameStyle;
  final TextStyle countStyle;

  TotalPay({
    required this.foodName,
    required this.count,
    this.foodNameStyle = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.countStyle = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        children: [
          Text(
            foodName,
            style: foodNameStyle,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  count,
                  style: countStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
