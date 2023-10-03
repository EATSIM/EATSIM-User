import 'package:flutter/material.dart';
import '../widgets/d_info.dart';
import '../widgets/d_create_review_widget.dart';

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
      appBar: const infoAppBar(title: '리뷰 쓰기'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
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
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          widget.menuName,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        const Row(
                          children: [
                            Icon(
                              Icons.room,
                              size: 12,
                              color: Color(0xffBDBDBD),
                            ),
                            SizedBox(width: 2),
                            Text(
                              'school',
                              style: TextStyle(
                                fontSize: 11,
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
                  const Align(
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
                  const SizedBox(height: 15),
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
                      const SizedBox(width: 10),
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
                  const SizedBox(height: 25),
                  const Align(
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
                  const SizedBox(height: 15),
                  const SelectionBox(),
                  const SizedBox(height: 25),
                  const Align(
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
                  const SizedBox(height: 15),
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
                      const SizedBox(width: 10),
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
                  const SizedBox(height: 25),
                  const Align(
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
                  const SizedBox(height: 20),
                  const StarRating(),
                  const SizedBox(height: 25),
                  const Align(
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
                  const SizedBox(height: 15),
                  const ReviewTextField(),
                  const SizedBox(height: 10),
                  const ReviewTextBox(),
                  const SizedBox(height: 20),
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
