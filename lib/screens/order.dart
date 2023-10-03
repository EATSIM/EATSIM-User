import 'package:flutter/material.dart';
import '../widgets/b_main.dart';
import '../widgets/c_order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrderAppBar(title: '장바구니'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              ListOrder(),
              TotalPayContent(),
              SizedBox(
                height: 10,
              ),
              PayButton(),
            ],
          ),
        ),
      ),
    );
  }
}
