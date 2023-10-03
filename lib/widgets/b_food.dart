import 'package:flutter/material.dart';
import '../screens/info_meun.dart';

class Food extends StatelessWidget {
  final List<String> foodNames;
  final List<String> prices;

  Food({required this.foodNames, required this.prices, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardWidth = 180.0;
    final double cardHeight = 230.0;
    final double spacing = 20.0;

    return ListView.builder(
      shrinkWrap: true,
      itemCount: (foodNames.length / 2).ceil(),
      itemBuilder: (context, index) {
        int startIndex = index * 2;
        int endIndex = startIndex + 2;
        if (endIndex > foodNames.length) {
          endIndex = foodNames.length;
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = startIndex; i < endIndex; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              InfoMenuScreen(), // TODO: Consider passing relevant food item data to InfoMenuScreen.
                        ),
                      );
                    },
                    child: Container(
                      width: cardWidth,
                      height: cardHeight,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                            ClipOval(
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/icon/cafeteria.jpeg'), // TODO: Use a dynamic image source based on food item.
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Text(
                              foodNames[i],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${prices[i]}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            // TODO: Use a dynamic star rating system based on actual rating data.
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int j = 0; j < 4; j++)
                                  const Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                const Icon(
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
                  ),
              ],
            ),
            SizedBox(height: spacing),
          ],
        );
      },
    );
  }
}
