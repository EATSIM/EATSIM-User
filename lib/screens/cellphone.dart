import 'package:flutter/material.dart';
import '../widgets/1_onboarding_widget/logo.dart';
import '../widgets/main_button_set.dart';
import '../widgets/textinput_widget.dart';

class CellphoneScreen extends StatefulWidget {
  const CellphoneScreen({Key? key}) : super(key: key);

  @override
  _CellphoneScreenState createState() => _CellphoneScreenState();
}

class _CellphoneScreenState extends State<CellphoneScreen> {
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoWidget(),
                const SizedBox(height: 30),
                TextInputWidget(
                  labelText: '휴대폰 번호를 입력해주세요.',
                  fontSize: 16.0,
                  color: Color(0xFFAFAFAF),
                  controller: _phoneNumberController,
                ),
                const SizedBox(height: 25),
                MainButtonSet(
                  onPressed: () {
                    String phoneNumber = _phoneNumberController.text;
                    Navigator.pushNamed(context, '/membership',
                        arguments: phoneNumber);
                  },
                  text: '휴대폰 본인인증',
                  // label: 'Submit',
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
