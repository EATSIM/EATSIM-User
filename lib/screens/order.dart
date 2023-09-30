import 'package:flutter/material.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OrderListScreen Screen')),
      body: Center(
        child: Text('Welcome to OrderListScreen Screen!'),
      ),
    );
  }
}
