import 'package:intl/intl.dart';

class OrderListItem {
  final int restaurantIdx;
  final String restaurantName;
  final int categoryIdx;
  final int foodIdx;
  final String foodName;
  final String foodCost;
  final int quantity;

  OrderListItem({
    required this.restaurantIdx,
    required this.restaurantName,
    required this.categoryIdx,
    required this.foodIdx,
    required this.foodName,
    required this.foodCost,
    required this.quantity,
  });

  factory OrderListItem.fromJson(Map<String, dynamic> json) {
    return OrderListItem(
      restaurantIdx: json['restaurantIdx'] ?? 0,
      restaurantName: json['restaurantName'] ?? '',
      categoryIdx: json['categoryIdx'] ?? 0,
      foodIdx: json['foodIdx'] ?? 0,
      foodName: json['foodName'] ?? '',
      foodCost: json['foodCost'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }
}

class OrderListDto {
  final int idx;
  final int userIdx;
  final List<OrderListItem> items;
  final String createdAt;
  final String updatedAt;

  OrderListDto({
    required this.idx,
    required this.userIdx,
    required this.items,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderListDto.fromJson(Map<String, dynamic> json) {
    var itemsFromJson = json['items'] as List<dynamic>? ?? [];
    List<OrderListItem> itemsList =
        itemsFromJson.map((i) => OrderListItem.fromJson(i)).toList();

    return OrderListDto(
      idx: json['idx'] ?? 0,
      userIdx: json['userIdx'] ?? 0,
      items: itemsList,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
  String getFormattedCreatedAt() {
    try {
      DateTime dateTime = DateTime.parse(createdAt);
      return DateFormat('yyyy년 MM월 dd일 HH시 mm분').format(dateTime);
    } catch (e) {
      print('날짜 포맷 변환 중 에러: $e');
      return createdAt; // 변환에 실패한 경우 원본 문자열 반환
    }
  }
}
