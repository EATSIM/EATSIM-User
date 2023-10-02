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
      appBar: const infoAppBar(title: 'REVIEW'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const ReviewSwitch(),
                const SizedBox(height: 15),
                Container(
                  height: 1,
                  color: const Color(0xFFEEEEEE),
                ),
                const SizedBox(height: 5),
                const SearchButtonRow(),
                const SizedBox(height: 5),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(reviewCount, (index) => const ReviewBox()),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const StartBottomBox(initialIndex: 1),
    );
  }
}
