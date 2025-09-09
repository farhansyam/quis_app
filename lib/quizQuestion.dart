import 'package:flutter/material.dart';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
    ;
  }
}
