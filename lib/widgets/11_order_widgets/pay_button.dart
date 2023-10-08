import 'package:flutter/material.dart';

class PayButton extends StatefulWidget {
  final VoidCallback? onPressed;

  const PayButton({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _PayButtonState createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  bool isFirstPress = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        onPressed: () {
          if (isFirstPress) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('주문이 맞는지 확인해주세요')),
            );
            setState(() {
              isFirstPress = false;
            });
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            Navigator.pushNamed(context, '/first');
            widget.onPressed?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF7AF48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Center(
          child: Text(
            '결제하기',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
