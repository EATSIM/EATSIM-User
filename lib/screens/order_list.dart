import 'package:flutter/material.dart';
import '../widgets/d_order_list_widget.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final List<String> menuNames = ['라면', '물냉면', '칼국수', '비빔냉면', '파스타', '잔치국수'];
  final List<String> schools = ['대구가톨릭대학교 중앙도서관 식당', 'GU', 'DD', 'A', 'B', 'C'];
  final List<String> times = [
    '2021년 10월 16일 12시 10분',
    '2022',
    '2023',
    '2024',
    '2025',
    '2025'
  ];
  final List<String> starRatings = ['4.5', '5', '3.5', '4.6', '3.7', '3.9'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Column(
                children: List.generate(
                  menuNames.length,
                  (index) => Column(
                    children: [
                      OrderList(
                        imageUrl: 'assets/icon/home_no.png',
                        menuName: menuNames[index],
                        school: schools[index],
                        time: times[index],
                        stars: starRatings[index],
                      ),
                      if (index != menuNames.length - 1)
                        const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
