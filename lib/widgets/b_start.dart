import 'package:flutter/material.dart';
import 'package:eat_sim/screens/category.dart';

class MyContainer extends StatelessWidget {
  final String cafeteriaName;
  final String location;
  final String menu;

  const MyContainer({super.key, 
    required this.cafeteriaName,
    required this.location,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(cafeteriaName: cafeteriaName),
          ),
        );
      },
      child: Container(
        width: 358.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/icon/cafeteria.jpeg',
                    width: 112.0,
                    height: 112.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cafeteriaName,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '위치: $location',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '메뉴: $menu',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Positioned(top: 25, left: 244, child: stateButton()),
          ],
        ),
      ),
    );
  }
}

//짝수번째 컨테이너 형식
class bContainer extends StatelessWidget {
  final String cafeteriaName;
  final String location;
  final String menu;

  const bContainer({super.key, 
    required this.cafeteriaName,
    required this.location,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(cafeteriaName: cafeteriaName),
          ),
        );
      },
      child: Container(
        width: 358.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cafeteriaName,
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '위치: $location',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '메뉴: $menu',
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/icon/cafeteria.jpeg',
                    width: 112.0,
                    height: 112.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const Positioned(top: 25, left: 15, child: stateButton()),
          ],
        ),
      ),
    );
  }
}

class stateButton extends StatelessWidget {
  const stateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 99,
      height: 29,
      decoration: const BoxDecoration(
        color: Color(0xffF7AF48),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: const Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '30 / 100 이용중',
              style: TextStyle(color: Colors.black, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
