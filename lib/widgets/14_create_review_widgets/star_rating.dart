import 'package:flutter/material.dart';

//별점
class StarRating extends StatefulWidget {
  const StarRating({super.key});

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (selectedStars == index + 1) {
                selectedStars = 0;
              } else {
                selectedStars = index + 1;
              }
            });
          },
          child: Icon(
            index < selectedStars ? Icons.star : Icons.star_border,
            color: index < selectedStars
                ? const Color(0xffFFD233)
                : const Color(0xffFFD233),
            size: 41.0,
          ),
        );
      }),
    );
  }
}
