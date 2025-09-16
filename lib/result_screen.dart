import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
    this.restartQuestion, {
    super.key,
    required this.selectedAnswer,
  });

  final Function() restartQuestion;
  final List<String> selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Your Answered x out of y question correctly'),
            SizedBox(height: 30),
            Text('List of Answer and questions'),
            SizedBox(height: 30),

            TextButton(
              onPressed: restartQuestion,
              child: Text('Restart Quiz'),
              style: TextButton.styleFrom(backgroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
