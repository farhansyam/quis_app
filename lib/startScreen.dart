import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class startScreen extends StatelessWidget {
  const startScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 250),
          SizedBox(height: 50),
          Text(
            'Belajar Flutter dnengan mudah',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: switchScreen, child: Text('Mulai Quiz')),
        ],
      ),
    );
  }
}
