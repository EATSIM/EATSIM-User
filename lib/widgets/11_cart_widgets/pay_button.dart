import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eat_sim/provider.dart';
import '../../server/order_list_server.dart';

// PayButton 위젯
class PayButton extends StatefulWidget {
  final VoidCallback? onSuccess;
  final CartProvider cartProvider;
  final UserProvider userProvider;

  const PayButton({
    this.onSuccess,
    required this.cartProvider,
    required this.userProvider,
    Key? key,
  }) : super(key: key);

  @override
  _PayButtonState createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {
  bool isFirstPress = true;

  @override
  Widget build(BuildContext context) {
    final orderlistserver = CartItemserver(
      context: context,
      cartProvider: widget.cartProvider,
      userProvider: widget.userProvider,
      authProvider: Provider.of<AuthProvider>(context, listen: false),
    );

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
            orderlistserver.handlePayment(onSuccess: widget.onSuccess);
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
