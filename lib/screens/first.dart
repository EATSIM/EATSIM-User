import 'package:flutter/material.dart';
import '../widgets/app_bar_set.dart';
import 'restaurant.dart';
import '13_order_list.dart';
import '12_view_reviews.dart';
import '15_info_personal.dart';

class firstScreeon extends StatefulWidget {
  const firstScreeon({Key? key}) : super(key: key);

  @override
  _firstScreeonState createState() => _firstScreeonState();
}

class _firstScreeonState extends State<firstScreeon> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    RestaurantScreen(),
    ViewReviewsScreen(),
    OrderListScreen(),
    InfoPersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: StartBottomBox(
        initialIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    switch (_selectedIndex) {
      case 1:
        return const infoAppBar(title: 'REVIEW');
      case 2:
        return const infoAppBar(title: 'Order List');
      case 3:
        return const infoAppBar(title: 'Profile');
      default:
        return const RestaurantAppBar(title: '대구가톨릭대학교');
    }
  }
}

class StartBottomBox extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> onTap;

  const StartBottomBox({Key? key, this.initialIndex = 0, required this.onTap})
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
          top: BorderSide(color: const Color(0xffC5C5C5), width: 0.5),
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
          const SizedBox(height: 10),
          Icon(
            iconData,
            size: 24,
            color: isSelected ? Colors.black : const Color(0xFFC5C5C5),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : const Color(0xFFC5C5C5),
            ),
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
