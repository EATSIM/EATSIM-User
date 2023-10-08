import 'package:flutter/material.dart';

//리뷰 스위치
class ReviewSwitch extends StatefulWidget {
  const ReviewSwitch({super.key});

  @override
  _ReviewSwitchState createState() => _ReviewSwitchState();
}

class _ReviewSwitchState extends State<ReviewSwitch> {
  bool _isMyReviewSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 193,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF0F0F0)),
      child: Row(
        children: [
          _buildToggleButton('Review', _isMyReviewSelected, () {
            setState(() {
              _isMyReviewSelected = true;
            });
          }),
          _buildToggleButton('My Review', !_isMyReviewSelected, () {
            setState(() {
              _isMyReviewSelected = false;
            });
          }),
        ],
      ),
    );
  }

  Expanded _buildToggleButton(
      String text, bool isSelected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xffF7AF48) : null,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : const Color(0xff7E7E7E),
            ),
          ),
        ),
      ),
    );
  }
}
