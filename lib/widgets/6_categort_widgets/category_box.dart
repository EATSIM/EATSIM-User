import 'package:flutter/material.dart';
import '../../screens/7_meun.dart';
import '../../models/category_info.dart';
import '../../models/foods.dart';
import '../../server/categort_service.dart';
import '../../server/food_server.dart';

class CateBox extends StatefulWidget {
  final String restaurantName;
  final int restaurantIdx;
  final String token;

  CateBox({
    Key? key,
    required this.restaurantName,
    required this.restaurantIdx,
    required this.token,
  }) : super(key: key);

  @override
  _CateBoxState createState() => _CateBoxState();
}

class _CateBoxState extends State<CateBox> {
  late List<Category> categories = [];
  late Map<int, List<Foodmodel>> allCategoryFoods = {};

  @override
  void initState() {
    super.initState();
    _fetchCategoriesAndFoods();
  }

  Future<void> _fetchCategoriesAndFoods() async {
    try {
      categories = await CategoryService.fetchCategorysByRestaurant(
          widget.restaurantIdx, widget.token);
      List<Future<List<Foodmodel>>> foodFutures = [];
      for (Category category in categories) {
        foodFutures.add(
            FoodServer.fetchFoodByCategory(category.categoryIdx, widget.token));
      }
      List<List<Foodmodel>> foodsList = await Future.wait(foodFutures);
      for (int i = 0; i < categories.length; i++) {
        allCategoryFoods[categories[i].categoryIdx] = foodsList[i];
      }
      setState(() {});
    } catch (e) {
      print('Error fetching categories and foods: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> categoryNames = categories.map((e) => e.categoryName).toList();
    List<int> categoryIdxs = categories.map((e) => e.categoryIdx).toList();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            category: categories[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuScreen(
                    restaurantName: widget.restaurantName,
                    restaurantIdx: widget.restaurantIdx,
                    categoryNames: categoryNames,
                    categoryIdxs: categoryIdxs,
                    selectedCategory: categories[index].categoryName,
                    token: widget.token,
                    allCategoryFoods: allCategoryFoods,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  CategoryItem({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    int index = category.categoryIdx;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: index == 0 ? Color(0xFFF6F6F6) : null,
          image: index != 0
              ? DecorationImage(
                  image: AssetImage('assets/icon/cafeteria.jpeg'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.5),
          ),
          child: Stack(
            children: [
              if (index == 0)
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    category.categoryName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
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
