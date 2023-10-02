import 'package:flutter/material.dart';
import '../widgets/d_info.dart';
import '../widgets/b_start.dart';
import '../widgets/b_main.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final List<String> cafeteriaNames = ['제 1 식당', '제 2 식당', '제 3 식당'];
  final List<String> locations = ['위치1', '위치2', '위치3'];
  final List<String> menus = ['메뉴', '메뉴2', '메뉴3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StartAppBar(title: '대구가톨릭대학교'),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: List.generate(
                cafeteriaNames.length,
                (index) {
                  // 홀수 번째 아이템일 때 bContainer를, 짝수 번째 아이템일 때 MyContainer를 사용
                  if (index.isOdd) {
                    return Column(
                      children: [
                        bContainer(
                          cafeteriaName: cafeteriaNames[index],
                          location: locations[index],
                          menu: menus[index],
                        ),
                        const SizedBox(height: 20), // 컨테이너와 컨테이너 사이 간격
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        MyContainer(
                          cafeteriaName: cafeteriaNames[index],
                          location: locations[index],
                          menu: menus[index],
                        ),
                        const SizedBox(height: 20), // 컨테이너와 컨테이너 사이 간격
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: StartBottomBox(initialIndex: 0),
    );
  }
}
