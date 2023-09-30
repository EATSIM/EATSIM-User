import 'package:flutter/material.dart';

class StartAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const StartAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Color(0xFFF7AF48),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(105.0);
}

class StartBottomBox extends StatefulWidget {
  @override
  _StartBottomBoxState createState() => _StartBottomBoxState();
}

class _StartBottomBoxState extends State<StartBottomBox> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: 395,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildImageWithText(
              context, 'assets/icon/home_no.png', 'HOME', '/start', 0),
          _buildImageWithText(
              context, 'assets/icon/review.png', 'REVIEW', '/view_reviews', 1),
          _buildImageWithText(
              context, 'assets/icon/order.png', 'ORDER', '/order_list', 2),
          _buildImageWithText(
              context, 'assets/icon/person.png', 'MY', '/info_personal', 3),
        ],
      ),
    );
  }

  Widget _buildImageWithText(BuildContext context, String imageName,
      String label, String routeName, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.pushNamed(context, routeName);
      },
      child: Column(
        children: [
          SizedBox(height: 5),
          Image.asset(
            imageName,
            width: 30,
            height: 30,
            color: isSelected ? Colors.black : null,
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Color(0xFFC5C5C5),
            ),
          ),
        ],
      ),
    );
  }
}
