import 'package:flutter/material.dart';

//리뷰 선택 버튼
class ReviewChoiceButton extends StatefulWidget {
  final String buttonText;
  final Function()? onTap;
  final bool isSelected;

  const ReviewChoiceButton({super.key, 
    required this.buttonText,
    this.onTap,
    this.isSelected = false,
  });

  @override
  _ReviewChoiceButtonState createState() => _ReviewChoiceButtonState();
}

class _ReviewChoiceButtonState extends State<ReviewChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 168, height: 48),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) || widget.isSelected) {
                return const Color(0xffF7AF48);
              }
              return Colors.white;
            },
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color:
                    widget.isSelected ? Colors.transparent : const Color(0xffF5F5F5),
              ),
            ),
          ),
        ),
        onPressed: widget.onTap,
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : const Color(0xff777777),
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

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
            color:
                index < selectedStars ? const Color(0xffFFD233) : const Color(0xffFFD233),
            size: 41.0,
          ),
        );
      }),
    );
  }
}

//보기가 여러개
class SelectionBox extends StatefulWidget {
  const SelectionBox({super.key});

  @override
  _SelectionBoxState createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  int? selectedSection;
  @override
  Widget build(BuildContext context) {
    List<String> sections = ['짜요', '느끼해요', '적당해요', '달아요', '매워요'];

    return Container(
      width: 351,
      height: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xffF5F5F5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(sections.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedSection = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedSection == index
                      ? const Color(0xffF7AF48)
                      : Colors.transparent,
                ),
                child: Text(
                  sections[index],
                  style: TextStyle(
                    color: selectedSection == index
                        ? Colors.white
                        : const Color(0xff777777),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

//리뷰 글 작성
class ReviewTextField extends StatefulWidget {
  const ReviewTextField({super.key});

  @override
  _ReviewTextFieldState createState() => _ReviewTextFieldState();
}

class _ReviewTextFieldState extends State<ReviewTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 209,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(color: const Color(0xFFDDDDDD)),
      ),
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _controller,
        maxLines: null,
        expands: true,
        style: const TextStyle(fontSize: 13),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '자세한 리뷰는 더 나은 서비스 제공에 도움이 됩니다.',
          contentPadding: EdgeInsets.all(10),
        ),
      ),
    );
  }
}

//리뷰 알림창
class ReviewTextBox extends StatelessWidget {
  const ReviewTextBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 393,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '리뷰 작성 시 유의사항',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xff9E9E9E)),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Text(
              '음식과 관련없거나 부적절한 리뷰는 앱 내에 등록되지 않습니다.\n또한, ~~',
              style: TextStyle(fontSize: 13, color: Color(0xff9E9E9E)),
            ),
          ),
        ],
      ),
    );
  }
}

//리뷰 완료버튼
class ReviewEndButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ReviewEndButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      margin: const EdgeInsets.only(bottom: 40.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF7AF48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: const Center(
          child: Text(
            '리뷰 등록하기',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
