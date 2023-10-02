import 'package:flutter/material.dart';
import 'package:eat_sim/screens/create_review.dart';

//상당 앱바
class infoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const infoAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0),
      child: AppBar(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/start');
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}

//하단 버튼들
class StartBottomBox extends StatefulWidget {
  final int initialIndex;

  StartBottomBox({this.initialIndex = 0});

  @override
  _StartBottomBoxState createState() => _StartBottomBoxState();
}

class _StartBottomBoxState extends State<StartBottomBox> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 395,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffC5C5C5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildImageWithText(context, Icons.home, 'HOME', '/start', 0),
          _buildImageWithText(
              context, Icons.rate_review, 'REVIEW', '/view_reviews', 1),
          _buildImageWithText(
              context, Icons.shopping_cart, 'ORDER', '/order_list', 2),
          _buildImageWithText(context, Icons.person, 'MY', '/info_personal', 3),
        ],
      ),
    );
  }

  Widget _buildImageWithText(BuildContext context, IconData iconData,
      String label, String routeName, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: [
          SizedBox(height: 10),
          Icon(
            iconData,
            size: 25,
            color: isSelected ? Colors.black : Color(0xFFC5C5C5),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Color(0xFFC5C5C5),
            ),
          ),
        ],
      ),
    );
  }
}

//주문내역확인
class OrderList extends StatelessWidget {
  final String imageUrl;
  final String menuName;
  final String school;
  final String time;
  final String stars;

  OrderList(
      {required this.imageUrl,
      required this.menuName,
      required this.school,
      required this.time,
      required this.stars});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 359,
      height: 151,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 0.5),
        boxShadow: [
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
                padding: EdgeInsets.only(bottom: 30),
                child: Image.asset(
                  imageUrl,
                  width: 98,
                  height: 94,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    menuName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.room,
                        size: 15,
                        color: Color(0xffBDBDBD),
                      ),
                      SizedBox(width: 5),
                      Text(
                        school,
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xffBDBDBD),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    time,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffB3B3B3),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text(
                        stars,
                        style: TextStyle(
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

  ReviewButton({required this.menuName});
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
        decoration: BoxDecoration(
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
        child: Row(
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
