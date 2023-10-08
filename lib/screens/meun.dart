import 'package:flutter/material.dart';
import '../widgets/app_bar_set.dart';
import '../widgets/b_menu_bar.dart';

class MenuScreen extends StatefulWidget {
  final String cafeteriaName;

  const MenuScreen({Key? key, required, required this.cafeteriaName})
      : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MenuAppBar(cafeteriaName: '${widget.cafeteriaName}'),
        body: Center(
            child: Column(
          children: [
            Expanded(child: TopMenuBar()),
          ],
        )),
      ),
    );
  }
}
