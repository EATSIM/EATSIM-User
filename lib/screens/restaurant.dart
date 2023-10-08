import 'package:flutter/material.dart';
import '../widgets/b_restaurant.dart';
import '../widgets/11_order_widgets/shopping_cart.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final List<String> cafeteriaNames = [
    '제 1 식당',
    '제 2 식당',
    '제 3 식당',
  ];
  final List<String> locations = [
    '위치1',
    '위치2',
    '위치3',
  ];
  final List<String> menus = [
    '메뉴',
    '메뉴2',
    '메뉴3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: List.generate(
                cafeteriaNames.length,
                (index) {
                  // 홀수 번째 아이템일 때 bContainer를, 짝수 번째 아이템일 때 oneRestaurant를 사용
                  if (index.isOdd) {
                    return Column(
                      children: [
                        const SizedBox(height: 10),
                        twoRestaurant(
                          cafeteriaName: cafeteriaNames[index],
                          location: locations[index],
                          menu: menus[index],
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  } else {
                    return Stack(
                      children: [
                        oneRestaurant(
                          cafeteriaName: cafeteriaNames[index],
                          location: locations[index],
                          menu: menus[index],
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ShoppingCart(),
    );
  }
}

Widget oneRestaurant({
  required String cafeteriaName,
  required String location,
  required String menu,
}) {
  return Container(
    width: 358.0,
    height: 120.0,
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          child: MyContainer(
            cafeteriaName: cafeteriaName,
            location: location,
            menu: menu,
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: ClipOvalImage(),
        ),
      ],
    ),
  );
}

Widget twoRestaurant({
  required String cafeteriaName,
  required String location,
  required String menu,
}) {
  return Container(
    width: 358.0,
    height: 120.0,
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          child: bContainer(
            cafeteriaName: cafeteriaName,
            location: location,
            menu: menu,
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: ClipOvalImage(),
        ),
      ],
    ),
  );
}
