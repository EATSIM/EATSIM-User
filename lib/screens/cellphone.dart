import 'package:flutter/material.dart';
import '../widgets/logo.dart';
import '../buttons/cellphone_button.dart';
import '../widgets/textinput_widget.dart';

class CellphoneScreen extends StatefulWidget {
  const CellphoneScreen({Key? key}) : super(key: key);

  @override
  _CellphoneScreenState createState() => _CellphoneScreenState();
}

class _CellphoneScreenState extends State<CellphoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LogoWidget(),
              const SizedBox(height: 30),
              const TextInputWidget(
                labelText: '본인인증을 진행해주세요.',
                fontSize: 16.0,
                color: Color(0xFFAFAFAF),
              ),
              const SizedBox(height: 25),
              CellphoneButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/membership');
                },
                label: 'Submit',
              ),
              const SizedBox(height: 200),
            ],
          ),
        ),
      ),
    );
  }
}
