import 'package:flutter/material.dart';
import '../../screens/8_meun_info.dart';
import '../../models/foods.dart';

class MeunBox extends StatelessWidget {
  final String restaurantName;
  final int restaurantIdx;
  final List<String> foodNames;
  final List<String> foodCosts;
  final List<String> foodInfo;
  final Map<int, List<Foodmodel>> allCategoryFoods;
  final String token;
  final List<int> foodIdx;
  final int categoryIdx;

  MeunBox(
      {required this.restaurantName,
      required this.restaurantIdx,
      required this.foodNames,
      required this.foodCosts,
      required this.foodInfo,
      required this.allCategoryFoods,
      required this.token,
      required this.foodIdx,
      required this.categoryIdx,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (foodNames.isEmpty || foodCosts.isEmpty) {
      return Container();
    }
    final double cardWidth = 180.0;
    final double cardHeight = 230.0;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: cardWidth / cardHeight,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
      ),
      itemCount: foodNames.length,
      itemBuilder: (context, index) => _FoodItem(
        name: foodNames[index],
        cost: foodCosts[index],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => InfoMenuScreen(
                      foodName: foodNames[index],
                      foodCosts: foodCosts[index],
                      foodInfo: foodInfo[index],
                      allCategoryFoods: allCategoryFoods,
                      restaurantName: restaurantName,
                      token: token,
                      categoryIdx: categoryIdx,
                      foodIdx: foodIdx[index], // Pass the appropriate foodIdx
                      restaurantIdx: restaurantIdx,
                    )),
          );
        },
      ),
    );
  }
}

class _FoodItem extends StatelessWidget {
  final String name;
  final String cost;
  final VoidCallback onTap;

  _FoodItem({
    required this.name,
    required this.cost,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            ClipOval(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icon/cafeteria.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              cost,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     for (int j = 0; j < 4; j++)
            //       const Icon(
            //         Icons.star,
            //         color: Colors.grey,
            //         size: 16,
            //       ),
            //     const Icon(
            //       Icons.star_border,
            //       color: Colors.grey,
            //       size: 16,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
