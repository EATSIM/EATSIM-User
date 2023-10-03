import 'package:flutter/material.dart';
import '../widgets/d_view_review_widget.dart';

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
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: [
          Column(
            children: [
              const ReviewSwitch(),
              const SizedBox(height: 15),
              Container(
                height: 0.5,
                color: const Color(0xFFF5F5F5),
              ),
              const SizedBox(height: 10),
              const SearchButtonRow(),
              const SizedBox(height: 10),
              Container(
                height: 8,
                color: const Color(0xFFF5F5F5),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children:
                    List.generate(reviewCount, (index) => const ReviewBox()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
