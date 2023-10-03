import 'package:flutter/material.dart';
import '../widgets/b_info_food.dart';

class InfoMenuScreen extends StatefulWidget {
  const InfoMenuScreen({Key? key}) : super(key: key);

  @override
  _InfoMenuScreenState createState() => _InfoMenuScreenState();
}

class _InfoMenuScreenState extends State<InfoMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('김치찌개'),
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
              Navigator.pushReplacementNamed(context, '/menu');
            },
          ),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: InfoTopBar(),
            )
          ],
        )),
      ),
    );
  }
}
