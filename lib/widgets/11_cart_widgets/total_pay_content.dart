import 'package:flutter/material.dart';
import 'package:eat_sim/widgets/11_cart_widgets/total_pay.dart';
import 'package:eat_sim/provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class TotalPayContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // CartProvider에 액세스
    final cartProvider = Provider.of<CartProvider>(context);
    final totalCost = cartProvider.totalFoodCost;

    // int를 "16,000원" 형식의 문자열로 변환하는 함수
    String formatCost(double cost) {
      final NumberFormat formatter = NumberFormat('#,###');
      return "${formatter.format(cost)}원";
    }

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
            count: formatCost(totalCost),
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
          // TotalPay(
          //   foodName: '할인',
          //   count: '0원',
          //   foodNameStyle: TextStyle(
          //     fontSize: 15.0,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xff626262),
          //   ),
          //   countStyle: TextStyle(
          //     fontSize: 15.0,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xff626262),
          //   ),
          // ),
          SizedBox(height: 10),
          TotalPay(
            foodName: '총 결제금액',
            count: formatCost(totalCost),
          ),
        ],
      ),
    );
  }
}
