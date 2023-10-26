import 'package:flutter/material.dart';
import 'package:eat_sim/models/cart_item.dart';

class OrderItemRow extends StatefulWidget {
  final CartItem item;

  OrderItemRow({required this.item});

  @override
  _OrderItemRowState createState() => _OrderItemRowState();
}

class _OrderItemRowState extends State<OrderItemRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        children: [
          Text(
            widget.item.foodName,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 10),
                Text(
                  widget.item.foodCost,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                // TextButton(
                //   onPressed: () {
                //     Provider.of<CartProvider>(context, listen: false)
                //         .removeItem(widget.item);
                //   },
                //   child: Text(
                //     '삭제',
                //     style: TextStyle(
                //       fontSize: 12.0,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.red,
                //     ),
                //   ),
                //   style: TextButton.styleFrom(
                //     primary: Colors.red,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
