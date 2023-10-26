import 'package:flutter/material.dart';
import 'package:eat_sim/screens/6_category.dart';

Widget restaurantItem({
  required String restaurantName,
  required String location,
  required String info,
  required bool imageOnLeft,
  required int restaurantIdx,
  required String token,
}) {
  return Container(
    width: 358.0,
    height: 120.0,
    child: Stack(
      children: [
        Positioned(
          bottom: 0,
          child: RestaurantInfoContainer(
            restaurantName: restaurantName,
            location: location,
            info: info,
            imageOnLeft: imageOnLeft,
            restaurantIdx: restaurantIdx,
            token: token,
          ),
        ),
        Positioned(
          top: 5,
          left: imageOnLeft ? 5 : null,
          right: imageOnLeft ? null : 5,
          child: ClipOvalImage(),
        ),
      ],
    ),
  );
}

class RestaurantInfoContainer extends StatelessWidget {
  final String restaurantName;
  final String location;
  final String info;
  final bool imageOnLeft;
  final int restaurantIdx; // 여기에 추가
  final String token; // 여기에 추가

  const RestaurantInfoContainer({
    Key? key,
    required this.restaurantName,
    required this.location,
    required this.info,
    required this.imageOnLeft,
    required this.restaurantIdx, // 여기에 추가
    required this.token, // 여기에 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              restaurantName: restaurantName,
              restaurantIdx: restaurantIdx,
              token: token,
            ),
          ),
        );
      },
      child: Container(
        width: 358.0,
        height: 109.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            if (imageOnLeft)
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 10, bottom: 5),
                child: ClipOvalImage(),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: imageOnLeft
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurantName,
                    style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '위치: $location',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '정보: $info',
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            if (!imageOnLeft)
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 5, bottom: 5),
                child: ClipOvalImage(),
              ),
          ],
        ),
      ),
    );
  }
}

class ClipOvalImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipOval(
        child: Image.asset(
          'assets/icon/cafeteria.jpeg',
          width: 110.0,
          height: 110.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


// class stateButton extends StatelessWidget {
//   const stateButton({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 99,
//       height: 29,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Color(0xffF7AF48),
//       ),
//       child: const Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '30 / 100 이용중',
//               style: TextStyle(color: Colors.white, fontSize: 12),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
