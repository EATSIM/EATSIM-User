import 'package:flutter/material.dart';
import '../widgets/13_order_list_widgets/order_list.dart';
import '../models/order_list_item.dart';
import '../server/order_list_server.dart';

class OrderListScreen extends StatefulWidget {
  final Map<String, dynamic>? userInfo;
  final String? token;

  const OrderListScreen({Key? key, required this.userInfo, required this.token})
      : super(key: key);

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  late final OrderListService orderListService;
  List<OrderListDto>? orders;

  // final List<String> starRatings = ['4.5', '5', '3.5', '4.6', '3.7', '3.9'];

  @override
  void initState() {
    super.initState();
    orderListService = OrderListService();
    loadOrders();
  }

  Future<void> loadOrders() async {
    print('loadOrders() 함수가 호출되었습니다.');

    final userIdx = widget.userInfo?['idx'];
    final token = widget.token;

    if (userIdx == null || token == null) {
      print('Error: userIdx 또는 token이 null입니다.');
      return;
    }

    print('userIdx: $userIdx');
    print('token: $token');

    try {
      print('서버에 주문 목록을 요청합니다...');
      final loadedOrders =
          await orderListService.getAllOrdersByUser(userIdx, token);

      if (loadedOrders != null) {
        print('주문 목록을 성공적으로 로드했습니다. 주문 개수: ${loadedOrders.length}');
        loadedOrders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      } else {
        print('주문 목록 로드에 실패했습니다.');
      }

      setState(() {
        orders = loadedOrders;
      });
    } catch (e) {
      print('주문 목록 로드 중 에러 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              if (orders != null && orders!.isNotEmpty)
                ...orders!.expand((order) {
                  return order.items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20), // Add space below each OrderList widget
                      child: OrderList(
                        imageUrl: 'assets/icon/home_no.png',
                        menuName: item.foodName,
                        school: item.restaurantName,
                        time: order
                            .getFormattedCreatedAt(), // You might want to format this date
                        // stars: starRating, // You need to provide this value
                      ),
                    );
                  }).toList();
                }).toList()
              else if (orders != null && orders!.isEmpty)
                Text('주문 내역이 없습니다.'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
