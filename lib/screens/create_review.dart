import 'package:flutter/material.dart';
import '../widgets/d_info.dart';
import '../widgets/create_review_widget.dart';

class CreateReviewScreen extends StatefulWidget {
  final String menuName;

  const CreateReviewScreen({Key? key, required this.menuName})
      : super(key: key);

  @override
  _CreateReviewScreenState createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  String selectedButton = '';
  String selectedFood = '';
  String selectedTaste = '';
  String selectedService = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: infoAppBar(title: '리뷰 쓰기'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icon/home_no.png',
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.menuName,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
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
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '음식은 어떠셨나요?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReviewChoiceButton(
                        buttonText: "맛있어요",
                        isSelected: selectedFood == "맛있어요",
                        onTap: () {
                          setState(() {
                            selectedFood = "맛있어요";
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      ReviewChoiceButton(
                        buttonText: "별로에요",
                        isSelected: selectedFood == "별로에요",
                        onTap: () {
                          setState(() {
                            selectedFood = "별로에요";
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '맛은 어떠셨나요?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SelectionBox(),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '서비스는 어떠셨나요?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReviewChoiceButton(
                        buttonText: "만족해요",
                        isSelected: selectedService == "만족해요",
                        onTap: () {
                          setState(() {
                            selectedService = "만족해요";
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      ReviewChoiceButton(
                        buttonText: "개선이 필요해요",
                        isSelected: selectedService == "개선이 필요해요",
                        onTap: () {
                          setState(() {
                            selectedService = "개선이 필요해요";
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '서비스은 어떠셨나요?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  StarRating(),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        '리뷰를 작성해주세요',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  ReviewTextField(),
                  SizedBox(height: 10),
                  ReviewTextBox(),
                  SizedBox(height: 20),
                  ReviewEndButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/start');
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
