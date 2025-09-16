import 'package:flutter/material.dart';
import 'package:quis_app/answer_button.dart';
import 'package:quis_app/data/qustions.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({
    super.key,
    required this.chooseAnswer, // Pastikan parameter ini ada
  });

  final void Function(String) chooseAnswer; // Pastikan tipe parameter sesuai

  @override
  State<QuizQuestion> createState() {
    return _QuizQuestionState();
  }
}

class _QuizQuestionState extends State<QuizQuestion> {
  var currentQuestionIndex = 0;

  void nextQuestion(String answer) {
    setState(() {
      currentQuestionIndex++;
      widget.chooseAnswer(
        answer,
      ); // Menggunakan chooseAnswer yang diterima dari widget
    });
  }

  void previousQuestion() {
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

            ...currentQuestion.getShuffeledAnswer().map((shuffledAnswer) {
              return answerButton(
                answerText: shuffledAnswer,
                onTap: () => nextQuestion(shuffledAnswer),
              );
            }),
            SizedBox(height: 50),
            ElevatedButton(onPressed: previousQuestion, child: Text('Back')),
          ],
        ),
      ),
    );
  }
}
