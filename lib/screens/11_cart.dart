import 'package:flutter/material.dart';
import '../widgets/app_bar_set.dart';
import '../widgets/11_cart_widgets/list_order.dart';
import '../widgets/11_cart_widgets/total_pay_content.dart';
import '../widgets/11_cart_widgets/pay_button.dart';
import 'package:eat_sim/provider.dart';
import 'package:provider/provider.dart';
import 'package:eat_sim/models/cart_item.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final cartItems = cartProvider.items;
    final user = userProvider.user;

    print(cartItems);
    print(user);

    return Scaffold(
      appBar: OrderAppBar(title: '장바구니'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              if (user != null) ...[
                Text('User Idx: ${user.idx}'),
                Text('School Idx: ${user.schoolIdx}'),
                Text('User Name: ${user.userName}'),
                Text('Phone : ${user.userCallNumber}'),
                SizedBox(height: 20),
              ],
              for (var item in cartItems)
                ListOrder(
                  item: item,
                  onRemove: () => setState(() {}),
                ),
              TotalPayContent(),
              SizedBox(height: 10),
              PayButton(
                cartProvider: cartProvider,
                userProvider: userProvider,
              ),
              ..._buildTextData(cartItems),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextData(List<CartItem> cartItems) {
    List<Widget> textWidgets = [];
    for (var item in cartItems) {
      textWidgets.add(Text('음식 이름: ${item.foodName}'));
      textWidgets.add(Text('음식 가격: ${item.foodCost}'));
      textWidgets.add(Text('음식점 이름: ${item.restaurantName}'));
      textWidgets.add(Text('음식 인덱스: ${item.foodIdx}'));
      textWidgets.add(Text('음식점 인덱스: ${item.restaurantIdx}'));
      textWidgets.add(Text('수량: ${item.quantity}'));
      textWidgets.add(Text('카테고리: ${item.categoryIdx}'));
      textWidgets.add(Divider()); // 각 아이템을 구분하기 위한 구분선
    }
    return textWidgets;
  }
}
