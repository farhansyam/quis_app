import 'package:flutter/material.dart';
import 'package:quis_app/answer_button.dart';
import 'package:quis_app/data/qustions.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({super.key});

  @override
  State<QuizQuestion> createState() {
    // TODO: implement createState
    return _quizQuestionState();
  }
}

class _quizQuestionState extends State<QuizQuestion> {
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
              return answerButton(
                answerText: shuffeledanswer,
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
