import 'package:flutter/material.dart';
import '../widgets/d_info.dart';
import '../widgets/view_review_widget.dart';

class ViewReviewsScreen extends StatefulWidget {
  const ViewReviewsScreen({Key? key}) : super(key: key);

  @override
  _ViewReviewsScreenState createState() => _ViewReviewsScreenState();
}

class _ViewReviewsScreenState extends State<ViewReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: infoAppBar(title: 'REVIEW'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("어떤 내용이든지 넣으세요"),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ReviewBox(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: StartBottomBox(initialIndex: 1),
    );
  }
}

