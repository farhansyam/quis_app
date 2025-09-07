import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pertannyan ?',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
    ;
  }
}
