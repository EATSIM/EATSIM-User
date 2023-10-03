import 'package:flutter/material.dart';
import '../widgets/b_category.dart';

class CategoryScreen extends StatefulWidget {
  final String cafeteriaName;

  const CategoryScreen({Key? key, required this.cafeteriaName})
      : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('대구가톨릭대학교 ${widget.cafeteriaName}'),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 26,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/start');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: CateBox(),
      ),
    );
  }
}
