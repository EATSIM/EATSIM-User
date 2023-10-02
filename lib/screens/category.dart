import 'package:flutter/material.dart';
import '../widgets/b_category.dart';

class CategoryScreen extends StatefulWidget {
  final String cafeteriaName;

  CategoryScreen({Key? key, required this.cafeteriaName}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('대구가톨릭대학교 ${widget.cafeteriaName}'),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/start');
          },
        ),
      ),
      body: CateBox(),
    );
  }
}
