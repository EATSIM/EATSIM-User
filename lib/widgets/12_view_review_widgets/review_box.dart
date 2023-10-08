import 'package:flutter/material.dart';

//리뷰 박스
class ReviewBox extends StatefulWidget {
  const ReviewBox({super.key});

  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 245,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: const Color(0xffEEEEEE))),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildHeader(),
            _buildLabelText('메뉴', '삼겹살'),
            _buildLabelText('맛', '맛있어요'),
            _buildLabelText('서비스', '좋아요'),
            _buildLabelText('별점', '', stars: 4),
            _buildLabelText('리뷰', '리뷰내용'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        Icon(
          Icons.account_circle,
          size: 45,
          color: Color(0xffA9A9A9),
        ),
        SizedBox(width: 13),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '맛있어요',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            Row(
              children: [
                Text(
                  '황**  | ',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '중앙도서관',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLabelText(String label, String content, {int stars = 0}) {
    return Row(
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E))),
        const SizedBox(width: 15),
        if (label == '별점')
          ...List.generate(
              5,
              (index) => Icon(index < stars ? Icons.star : Icons.star_border,
                  color: Colors.black, size: 17))
        else ...[
          Text(content,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
        ]
      ],
    );
  }
}
