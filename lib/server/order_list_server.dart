import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:eat_sim/provider.dart';
import '../models/order_list_item.dart';
import '../server/server_config.dart';

//장바구니 서버전송
class CartItemserver {
  final BuildContext context;
  final CartProvider cartProvider;
  final UserProvider userProvider;
  final AuthProvider authProvider;

  CartItemserver({
    required this.context,
    required this.cartProvider,
    required this.userProvider,
    required this.authProvider,
  });

  Future<void> handlePayment({VoidCallback? onSuccess}) async {
    print('handlePayment 시작');
    try {
      final user = userProvider.user;
      if (user == null) {
        print('에러: 유저 정보가 없습니다.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('유저 정보가 없습니다.')),
        );
        return;
      }

      print('주문 정보 생성');
      final orderData = {
        'userIdx': user.idx,
        'items': cartProvider.items.map((item) {
          return {
            'restaurantIdx': item.restaurantIdx,
            'categoryIdx': item.categoryIdx,
            'foodIdx': item.foodIdx,
            'quantity': item.quantity,
          };
        }).toList(),
      };
      print('서버로 전송되는 orderData: ${json.encode(orderData)}');

      final token = authProvider.token;
      print('사용되는 토큰: $token'); // 토큰 출력

      final url =
          ServerConfig.getBaseUrl().replace(path: '/user/order').toString();
      print('서버로 주문 정보 전송');
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': '$token',
        },
        body: json.encode(orderData),
      );

      print('서버 응답 상태 코드: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('주문 성공, 장바구니 비우기');
        cartProvider.clearCart();

        if (onSuccess != null) {
          print('성공 콜백 호출');
          onSuccess();
        }

        print('성공 페이지로 이동');
        Navigator.pushNamed(context, '/first');
      } else {
        print('서버 에러: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('주문에 실패했습니다. 다시 시도해주세요.')),
        );
      }
    } catch (error) {
      print('주문 실패: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('주문에 실패했습니다. 네트워크 상태를 확인해주세요.')),
      );
    }
  }
}

class OrderListService {
  Future<List<OrderListDto>?> getAllOrdersByUser(
      int userIdx, String token) async {
    final url =
        ServerConfig.getBaseUrl().replace(path: '/user/order_list/$userIdx');
    try {
      print('서버 요청 URL: $url');
      print('전달된 Token: $token');

      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      print('서버 응답 상태 코드: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('서버로부터 받은 데이터: ${response.body}');
        List<dynamic> body = json.decode(response.body);
        List<OrderListDto> orders = body
            .map(
              (dynamic item) => OrderListDto.fromJson(item),
            )
            .toList();
        return orders;
      } else {
        print('서버 에러: ${response.statusCode}');
        print('서버 에러 응답: ${response.body}');
        return null;
      }
    } catch (e) {
      print('요청 중 에러 발생: $e');
      return null;
    }
  }
}
