import 'package:flutter/material.dart';

const defaultColor = Color(0xFFC5C5C5);

class StartBottomBox extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onTap;

  const StartBottomBox(
      {Key? key, required this.initialIndex, required this.onTap})
      : super(key: key);

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
        border: Border(
          top: BorderSide(color: defaultColor, width: 0.5),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildImageWithText(context, Icons.home_outlined, 'HOME', 0),
          _buildImageWithText(context, Icons.rate_review_outlined, 'REVIEW', 1),
          _buildImageWithText(context, Icons.description_outlined, 'ORDER', 2),
          _buildImageWithText(context, Icons.person_outlined, 'MY', 3),
        ],
      ),
    );
  }

  Widget _buildImageWithText(
      BuildContext context, IconData iconData, String label, int index) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        if (selectedIndex != index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onTap(index);
        }
      },
      child: Column(
        children: [
          SizedBox(height: 10),
          Icon(
            iconData,
            size: 24,
            color: isSelected ? Colors.black : defaultColor,
          ),
          SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : defaultColor,
            ),
          ),
          SizedBox(height: 3),
        ],
      ),
    );
  }
}
