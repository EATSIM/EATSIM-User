import 'package:flutter/material.dart';
import 'package:eat_sim/widgets/11_order_widgets/total_pay.dart';

class TotalPayContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(20, 5, 30, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '결제금액',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TotalPay(
            foodName: '주문금액',
            count: '16,000원',
            foodNameStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
            countStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
          ),
          SizedBox(height: 10),
          TotalPay(
            foodName: '할인',
            count: '0원',
            foodNameStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
            countStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
          ),
          SizedBox(height: 10),
          TotalPay(foodName: '총 결제금액', count: '16,000원'),
        ],
      ),
    );
  }
}
