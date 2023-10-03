import 'package:flutter/material.dart';

//장바구니 가는 버튼
class ShoppingCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/order');
      },
      child: Container(
        width: 353,
        height: 53,
        decoration: BoxDecoration(
          color: Color(0xFFF7AF48),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.stars,
              size: 37,
              color: Color(0xffF9C841),
            ),
            Text(
              '주문하기',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              '6,000원',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

//주문 목록
class ListOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 366,
      height: 190,
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '식당이름',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.close),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          OrderListContent(),
        ],
      ),
    );
  }
}

class OrderListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: Column(
        children: [
          OrderItemRow(),
          SizedBox(height: 10),
          OrderItemRow(),
          SizedBox(height: 10),
          TotalAmountRow(),
        ],
      ),
    );
  }
}

class OrderItemRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        children: [
          Text(
            '음식명',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '갯수',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '금액',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '삭제',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TotalAmountRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '합계',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 75.0),
            child: Text(
              '금액',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TotalPayContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.fromLTRB(20, 5, 30, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(
              '결제금액',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TotalPay(
            foodName: '주문금액',
            count: '16,000원',
            foodNameStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
            countStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
          ),
          SizedBox(height: 10),
          TotalPay(
            foodName: '할인',
            count: '0원',
            foodNameStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
            countStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff626262),
            ),
          ),
          SizedBox(height: 10),
          TotalPay(foodName: '총 결제금액', count: '16,000원'),
        ],
      ),
    );
  }
}

class TotalPay extends StatelessWidget {
  final String foodName;
  final String count;
  final TextStyle foodNameStyle;
  final TextStyle countStyle;

  TotalPay({
    required this.foodName,
    required this.count,
    this.foodNameStyle = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    this.countStyle = const TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        children: [
          Text(
            foodName,
            style: foodNameStyle,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  count,
                  style: countStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
