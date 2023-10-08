import 'package:flutter/material.dart';

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
