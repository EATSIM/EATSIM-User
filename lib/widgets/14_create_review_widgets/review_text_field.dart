import 'package:flutter/material.dart';

//리뷰 글 작성
class ReviewTextField extends StatefulWidget {
  const ReviewTextField({super.key});

  @override
  _ReviewTextFieldState createState() => _ReviewTextFieldState();
}

class _ReviewTextFieldState extends State<ReviewTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 209,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: const Color(0xFFDDDDDD)),
      ),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        maxLines: null,
        expands: true,
        style: const TextStyle(fontSize: 13),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '자세한 리뷰는 더 나은 서비스 제공에 도움이 됩니다.',
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
