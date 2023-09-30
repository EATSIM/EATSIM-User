import 'package:flutter/material.dart';

class ViewReviewsScreen extends StatefulWidget {
  const ViewReviewsScreen({Key? key}) : super(key: key);

  @override
  _ViewReviewsScreenState createState() => _ViewReviewsScreenState();
}

class _ViewReviewsScreenState extends State<ViewReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ViewReviewsScreen Screen')),
      body: Center(
        child: Text('Welcome to StarViewReviewsScreent Screen!'),
      ),
    );
  }
}
