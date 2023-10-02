import 'package:flutter/material.dart';
import '../widgets/d_info.dart';
import '../widgets/view_review_widget.dart';

class ViewReviewsScreen extends StatefulWidget {
  const ViewReviewsScreen({Key? key}) : super(key: key);

  @override
  _ViewReviewsScreenState createState() => _ViewReviewsScreenState();
}

class _ViewReviewsScreenState extends State<ViewReviewsScreen> {
  final int reviewCount = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: infoAppBar(title: 'REVIEW'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ReviewSwitch(),
                SizedBox(height: 15),
                Container(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                ),
                SizedBox(height: 5),
                SearchButtonRow(),
                SizedBox(height: 5),
                Container(
                  height: 1,
                  color: Color(0xFFEEEEEE),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(reviewCount, (index) => ReviewBox()),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: StartBottomBox(initialIndex: 1),
    );
  }
}
