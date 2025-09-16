import 'package:flutter/material.dart';
import 'package:quis_app/result_screen.dart';
import 'package:quis_app/start_screen.dart';
import 'package:quis_app/quiz_question.dart';
import 'package:quis_app/data/qustions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswer = [];

  @override
  void initState() {
    super.initState();
    activeScreen = startScreen(switchScreen); // Pastikan startScreen valid
  }

  void restartQuestion() {
    selectedAnswer = [];
    setState(() {
      activeScreen = QuizQuestion(chooseAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    debugPrint(selectedAnswer.toString());

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(
          restartQuestion,
          selectedAnswer: selectedAnswer,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuizQuestion(
        chooseAnswer: chooseAnswer,
      ); // Pastikan mengirimkan chooseAnswer dengan benar
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WillPopScope(
        onWillPop: () async {
          if (activeScreen is QuizQuestion) {
            setState(() {
              activeScreen = startScreen(switchScreen);
            });
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.blue),
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
