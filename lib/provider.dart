import 'package:flutter/foundation.dart';
import 'models/cart_item.dart';
import 'models/user_info.dart';

//유저정보
class UserProvider with ChangeNotifier {
  UserDto? _user;

  UserDto? get user => _user;

  void setUser(UserDto user) {
    _user = user;
    notifyListeners();
  }
}

//토큰
class AuthProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void clearToken() {
    _token = null;
    notifyListeners();
  }
}

//장바구니 생성
class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  bool get isCartEmpty => _items.isEmpty;

  void addItem(CartItem item) {
    _items = List.from(_items)..add(item);
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalFoodCost {
    double totalCost = 0.0;
    for (var item in _items) {
      try {
        // 쉼표를 제거하고 실수형으로 변환
        double cost = double.parse(item.foodCost.replaceAll(',', ''));
        totalCost += cost * item.quantity;
      } catch (e) {
        // 변환에 실패할 경우, 에러 메시지를 출력하고 계산을 계속 진행
        print('Error parsing food cost: ${item.foodCost}');
      }
    }
    return totalCost;
  }
}
