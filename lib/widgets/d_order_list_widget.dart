import 'package:flutter/material.dart';
import 'package:eat_sim/screens/create_review.dart';

//주문내역확인
class OrderList extends StatelessWidget {
  final String imageUrl;
  final String menuName;
  final String school;
  final String time;
  final String stars;

  const OrderList(
      {super.key,
      required this.imageUrl,
      required this.menuName,
      required this.school,
      required this.time,
      required this.stars});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 359,
      height: 146,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: const Color(0xffBDBDBD), width: 0.1),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 4.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  imageUrl,
                  width: 98,
                  height: 94,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    menuName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.room,
                        size: 15,
                        color: Color(0xffBDBDBD),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        school,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xffBDBDBD),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xffB3B3B3),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        stars,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: ReviewButton(menuName: menuName),
          ),
        ],
      ),
    );
  }
}

//리뷰 보러는 버튼
class ReviewButton extends StatelessWidget {
  final String menuName;

  const ReviewButton({super.key, required this.menuName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateReviewScreen(menuName: menuName),
          ),
        );
      },
      child: Container(
        width: 125,
        height: 34,
        decoration: const BoxDecoration(
          color: Color(0xffF7AF48),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 4),
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Review',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.arrow_forward,
              color: Colors.black,
              size: 16,
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
