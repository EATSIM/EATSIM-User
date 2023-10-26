import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eat_sim/provider.dart';
import '../widgets/6_categort_widgets/category_box.dart';
import '../widgets/shopping_cart.dart';
import '../widgets/app_bar_set.dart';

class CategoryScreen extends StatefulWidget {
  final String restaurantName;
  final int restaurantIdx;
  final String token;

  const CategoryScreen({
    Key? key,
    required this.restaurantName,
    required this.restaurantIdx,
    required this.token,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MenuAppBar(restaurantName: '${widget.restaurantName}'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: CateBox(
          restaurantName: widget.restaurantName,
          restaurantIdx: widget.restaurantIdx,
          token: widget.token,
        ),
      ),
      bottomNavigationBar: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return cartProvider.isCartEmpty ? SizedBox.shrink() : ShoppingCart();
        },
      ),
    );
  }
}
