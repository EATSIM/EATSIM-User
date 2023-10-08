import 'package:flutter/material.dart';
import 'package:eat_sim/widgets/11_order_widgets/order_list_content.dart';

//주문 목록
class ListOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '식당이름',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.close),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          OrderListContent(),
        ],
      ),
    );
  }
}
