import 'package:flutter/material.dart';

//리뷰 선택 버튼
class ReviewChoiceButton extends StatefulWidget {
  final String buttonText;
  final Function()? onTap;
  final bool isSelected;

  const ReviewChoiceButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.isSelected = false,
  });

  @override
  _ReviewChoiceButtonState createState() => _ReviewChoiceButtonState();
}

class _ReviewChoiceButtonState extends State<ReviewChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 168, height: 48),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) || widget.isSelected) {
                return const Color(0xffF7AF48);
              }
              return Colors.white;
            },
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: widget.isSelected
                    ? Colors.transparent
                    : const Color(0xffF5F5F5),
              ),
            ),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : const Color(0xff777777),
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
