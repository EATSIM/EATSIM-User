import 'package:flutter/material.dart';

class ReviewBox extends StatefulWidget {
  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 245,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '메뉴',
            style: TextStyle(fontSize: 17),
          ),
          Text(
            '맛',
            style: TextStyle(fontSize: 17),
          ),
          Text(
            '서비스',
            style: TextStyle(fontSize: 17),
          ),
          Text(
            '별점',
            style: TextStyle(fontSize: 17),
          ),
          Text(
            '리뷰',
            style: TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}
void main() => runApp(MaterialApp(home: Scaffold(body: Center(child: ReviewBox()))));