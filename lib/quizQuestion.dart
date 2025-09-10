import 'package:flutter/material.dart';
import 'package:quis_app/answerButton.dart';
import 'package:quis_app/data/qustions.dart';

class quizQuestion extends StatefulWidget {
  const quizQuestion({super.key});

  @override
  State<quizQuestion> createState() {
    // TODO: implement createState
    return _quizQuestionState();
  }
}

class _quizQuestionState extends State<quizQuestion> {
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),
            ...currentQuestion.getShuffeledAnswer().map((shuffeledanswer) {
              return Column(
                children: [
                  answetButton(answetText: shuffeledanswer, onTap: () {}),
                  const SizedBox(height: 10),
                ],
              );
            }),
          ],
        ),
      ),
    );
    ;
  }
}
