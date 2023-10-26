import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_bar_set.dart';
import '../models/foods.dart';
import '../widgets/shopping_cart.dart';
import '../widgets/7_meun_widgets/meun_box.dart';
import 'package:eat_sim/provider.dart';

class MenuScreen extends StatefulWidget {
  final String restaurantName;
  final int restaurantIdx;
  final List<String> categoryNames;
  final String selectedCategory;
  final String token;
  final List<int> categoryIdxs;
  final Map<int, List<Foodmodel>> allCategoryFoods;

  const MenuScreen({
    Key? key,
    required this.restaurantName,
    required this.restaurantIdx,
    required this.categoryNames,
    required this.selectedCategory,
    required this.token,
    required this.categoryIdxs,
    required this.allCategoryFoods,
  }) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
    with SingleTickerProviderStateMixin {
  late int initialTabIndex;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    initialTabIndex = widget.categoryNames.indexOf(widget.selectedCategory);
    if (initialTabIndex == -1) {
      initialTabIndex = 0;
    }

    _tabController = TabController(
        length: widget.categoryNames.length,
        vsync: this,
        initialIndex: initialTabIndex);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(restaurantName: '${widget.restaurantName}'),
      body: DefaultTabController(
        initialIndex: initialTabIndex,
        length: widget.categoryNames.length,
        child: Column(
          children: [
            Container(
              color: Color(0xFFF7AF48),
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                indicatorColor: Colors.white,
                indicatorWeight: 3.0,
                tabs: widget.categoryNames
                    .map((category) => Tab(text: category))
                    .toList(),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: widget.categoryNames.map((category) {
                  int index = widget.categoryNames.indexOf(category);

                  if (index < 0 || index >= widget.categoryIdxs.length) {
                    return Center(
                        child: Text('Error: Invalid category or index.'));
                  }

                  int categoryIdx = widget.categoryIdxs[index];
                  List<Foodmodel> foods =
                      widget.allCategoryFoods[categoryIdx] ?? [];

                  if (foods.isEmpty) {
                    return Center(child: Text('No food items available.'));
                  }

                  return MeunBox(
                    foodNames: foods.map((food) => food.foodName).toList(),
                    foodCosts: foods.map((food) => food.foodCost).toList(),
                    foodInfo: foods.map((food) => food.foodInfo).toList(),
                    allCategoryFoods: widget.allCategoryFoods,
                    restaurantName: widget.restaurantName,
                    restaurantIdx: widget.restaurantIdx,
                    token: widget.token,
                    categoryIdx: categoryIdx,
                    foodIdx: foods.map((food) => food.foodIdx).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
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
