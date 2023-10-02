import 'package:flutter/material.dart';

//리뷰 스위치
class ReviewSwitch extends StatefulWidget {
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
          borderRadius: BorderRadius.circular(20), color: Color(0xffF0F0F0)),
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
            color: isSelected ? Color(0xffF7AF48) : null,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.black : Color(0xff7E7E7E),
            ),
          ),
        ),
      ),
    );
  }
}

//리뷰 검색 버튼
class SearchButtonRow extends StatefulWidget {
  @override
  _SearchButtonRowState createState() => _SearchButtonRowState();
}

class _SearchButtonRowState extends State<SearchButtonRow> {
  int _selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _customElevatedButton("식당", 52, 31, 0),
        SizedBox(width: 10),
        _customElevatedButton("메뉴", 54, 31, 1),
        SizedBox(width: 10),
        _customElevatedButton("만족도", 66, 31, 2),
      ],
    );
  }

  Widget _customElevatedButton(
      String label, double width, double height, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedButtonIndex = index;
        });
      },
      child: Text(
        label,
        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        primary: _selectedButtonIndex == index
            ? Color(0xffF7AF48)
            : Color(0xffF5F5F5),
        onPrimary: _selectedButtonIndex == index
            ? Color(0xff000000)
            : Color(0xff7E7E7E),
        elevation: 2,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

//리뷰 박스
class ReviewBox extends StatefulWidget {
  @override
  _ReviewBoxState createState() => _ReviewBoxState();
}

class _ReviewBoxState extends State<ReviewBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 395,
      height: 245,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffEEEEEE)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildHeader(),
            _buildLabelText('메뉴', '삼겹살'),
            _buildLabelText('맛', '맛있어요'),
            _buildLabelText('서비스', '좋아요'),
            _buildLabelText('별점', '', stars: 4),
            _buildLabelText('리뷰', '리뷰내용'),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(
          Icons.account_circle,
          size: 38,
          color: Color(0xffA9A9A9),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '맛있어요',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  'school',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffBDBDBD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLabelText(String label, String content, {int stars = 0}) {
    return Row(
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E))),
        SizedBox(width: 15),
        if (label == '별점')
          ...List.generate(
              5,
              (index) => Icon(index < stars ? Icons.star : Icons.star_border,
                  color: Colors.yellow, size: 17))
        else ...[
          Text(content,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
        ]
      ],
    );
  }
}
