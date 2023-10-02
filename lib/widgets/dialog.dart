import 'package:flutter/material.dart';

class CompletionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      backgroundColor: Color(0xFFFFFEFA),
      content: Container(
        width: 330,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 50.0),
            const Text(
              '회원가입이 완료되었습니다.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 40.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF7AF48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                minimumSize: Size(280, 40), // Set minimum width
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/start');
              },
              child: Text(
                '완료',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
