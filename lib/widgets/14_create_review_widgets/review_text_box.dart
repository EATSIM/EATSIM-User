import 'package:flutter/material.dart';

//리뷰 알림창
class ReviewTextBox extends StatelessWidget {
  const ReviewTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '리뷰 작성 시 유의사항',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E)),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Text(
              '음식과 관련없거나 부적절한 리뷰는 앱 내에 등록되지 않습니다.\n또한, ~~',
              style: TextStyle(fontSize: 13, color: Color(0xff9E9E9E)),
            ),
          ),
        ],
      ),
    );
  }
}
