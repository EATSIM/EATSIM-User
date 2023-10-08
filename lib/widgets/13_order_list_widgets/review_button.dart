import 'package:flutter/material.dart';
import 'package:eat_sim/screens/14_create_review.dart';

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
