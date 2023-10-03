import 'package:flutter/material.dart';
import '../widgets/b_menu_bar.dart';
import '../widgets/b_food_info.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key, required}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('대구가톨릭대학교 제 1 식당'),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Color(0xFFF7AF48),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/start');
            },
          ),
        ),
        body: Center(
            child: Column(
          children: [
            TopMenuBar(),
            SizedBox(height: 20),
            Food(),
          ],
        )),
      ),
    );
  }
}
