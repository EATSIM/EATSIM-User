import 'package:flutter/material.dart';
import 'package:eat_sim/provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  String formatCost(double cost) {
    final NumberFormat formatter = NumberFormat('#,###');
    return "${formatter.format(cost)}원";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/order');
      },
      child: Container(
        width: 353,
        height: 53,
        decoration: BoxDecoration(
          color: Color(0xFFF7AF48),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.stars,
              size: 37,
              color: Color(0xffF9C841),
            ),
            Text(
              '주문하기',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Consumer<CartProvider>(
              builder: (context, cart, child) {
                return Text(
                  formatCost(cart.totalFoodCost),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
