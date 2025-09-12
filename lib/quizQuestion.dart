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
  var currentQuestionIndex = 0;

  void changeQuestionIdex() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  void buttonBack() {
    setState(() {
      currentQuestionIndex--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(height: 20),

            ...currentQuestion.getShuffeledAnswer().map((shuffeledanswer) {
              return answetButton(
                answetText: shuffeledanswer,
                onTap: changeQuestionIdex,
              );
            }),
            SizedBox(height: 50),
            ElevatedButton(onPressed: buttonBack, child: Text('Back')),
          ],
        ),
      ),
    );
  }
}
