import 'package:flutter/material.dart';
import 'package:eat_sim/widgets/11_cart_widgets/order_item_row.dart';
import 'package:eat_sim/models/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:eat_sim/provider.dart';

//주문 목록
class ListOrder extends StatelessWidget {
  final CartItem item;
  final Function onRemove;

  ListOrder({required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 130,
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.restaurantName,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .removeItem(item);
                    onRemove();
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: OrderItemRow(item: item),
          ),
        ],
      ),
    );
  }
}
