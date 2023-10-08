import 'package:flutter/material.dart';
import '../widgets/b_category.dart';
import '../widgets/app_bar_set.dart';

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
      appBar: MenuAppBar(cafeteriaName: '${widget.cafeteriaName}'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: CateBox(
          cafeteriaName: widget.cafeteriaName,
        ),
      ),
    );
  }
}
