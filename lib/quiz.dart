import 'package:flutter/material.dart';
import 'package:quis_app/startScreen.dart';
import 'package:quis_app/quizQuestion.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = startScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = quizQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PopScope(
        canPop: false, // kita kontrol tombol back
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          // kalau lagi di quizQuestion → balik ke startScreen
          if (activeScreen is quizQuestion) {
            setState(() {
              activeScreen = startScreen(switchScreen);
            });
          } else {
            // kalau sudah di startScreen → izinkan app keluar
            Navigator.of(context).maybePop();
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
