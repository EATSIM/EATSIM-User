import 'package:flutter/material.dart';

class Food extends StatelessWidget {
  Food({Key? key}) : super(key: key);

  final List<String> food = ['김치찌개', '된장찌개', '부대찌개', '칼국수'];
  final List<String> price = ['6,000', '6,000', '6,000', '6,000'];

  @override
  Widget build(BuildContext context) {
    double cardWidth = 180.0;
    double cardHeight = 230.0;
    double spacing = 20.0;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: (food.length / 2).ceil(), // 한 줄에 두 개의 아이템을 표시
      itemBuilder: (context, index) {
        int startIndex = index * 2;
        int endIndex = startIndex + 2;
        if (endIndex > food.length) {
          endIndex = food.length;
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 중앙 정렬
              children: [
                for (int i = startIndex; i < endIndex; i++)
                  Container(
                    width: cardWidth,
                    height: cardHeight,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      //카드 안 내용
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          ClipOval(
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon/cafeteria.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            food[i],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${price[i]}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = 0; j < 4; j++)
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                              Icon(
                                Icons.star_border,
                                color: Colors.grey,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: spacing), // 간격 추가
          ],
        );
      },
    );
  }
}
